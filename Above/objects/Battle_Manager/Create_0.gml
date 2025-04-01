/// @description Insert description here
// You can write your code in this editor

instance_deactivate_object(Player)

units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];

turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 30;
battleWaitTimeRemaining = 0;
currentUser = noone;
currentAction = -1;
currentTargets = noone;

cursor = 
{
	activeUser: noone,
	activeTarget: noone,
	activeAction : -1,
	targetSide : -1,
	targetIndex : 0,
	targetAll : false,
	confirmDelay : 0,
	active : false
};

//Draws Enemies
for (var i = 0; i < array_length(enemies); i++)
{
	enemyUnits[i] = instance_create_depth(x+850+(i*10), y +340+(i*20), depth-10, Battle_enemy, enemies[i]);
	array_push(units, enemyUnits[i]);
}

//Draws Character
for (var i = 0; i < array_length(global.Character); i++)
{
	PlayerU[i] = instance_create_depth(x+400+(i*10), y +368+(i*15), depth-10, Battle_player, global.Character[i]);
	array_push(units, PlayerU[i]);
}

//Shuffle turn order
unitTurnOrder = array_shuffle(units);

//Render order
RefreshOrder = function()
{
	unitRenderOrder = [];
	array_copy(unitRenderOrder, 0, units,0,array_length(units));
	array_sort(unitRenderOrder,function(_1, _2)
	{
		return _1.y - _2.y;
	});
}

RefreshOrder();


// Allows the player to select their action from the actions menu
function BattleStateSelectAction()
{
	if (!instance_exists(battleMenu))
	{
	
		var _unit = unitTurnOrder[turn];
	
		if (!instance_exists(_unit)) || (_unit.hp <= 0)
		{
			battleState = BattleStateVictoryCheck;
			exit;
		}
	
		//BeginAction(_unit.id, global.actionLibrary.attack, _unit.id);
	
		if (_unit.object_index == Battle_player)
		{
			var _menuOptions = [];
			var _subMenus = {};
			
			var _actionList = _unit.actions;
			
			for (var i = 0; i < array_length(_actionList); i++)
			{
				var _action = _actionList[i];
				var _available = true;
				var _nameAndCount = _action.name;
				if (_action.subMenu == -1)
				{
					array_push(_menuOptions, [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
				}
				else
				{
					if (is_undefined(_subMenus[$ _action.subMenu]))
					{
						variable_struct_set(_subMenus, _action.subMenu, [[_nameAndCount, MenuSelectAction, [_unit, _action], _available]]);
					}
					else
					{
						array_push(_subMenus[$ _action.subMenu], [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
					}
				}
				
			
			}
			
			var _subMenusArray = variable_struct_get_names(_subMenus);
			for (var i = 0; i < array_length(_subMenusArray); i++)
			{
				//sort if needed 
				//here
					
				array_push(_subMenus[$ _subMenusArray[i]], ["Back", MenuGoBack, -1, true]);
					
				array_push(_menuOptions, [_subMenusArray[i], SubMenu, [_subMenus[$ _subMenusArray[i]]], true]);
			}
			
			Menu(x+200, y+600, _menuOptions, , 174, 160);
	
		}
		else
		{
			var _enemyAction = _unit.AIscript();
			if (_enemyAction != -1) BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
		}
	}
}

function BeginAction(_user, _action, _targets )
{
	currentUser = _user;
	currentAction = _action;
	currentTargets = _targets;
	if (!is_array(currentTargets)) currentTargets = [currentTargets];
	battleWaitTimeRemaining = battleWaitTimeFrames;
	with (_user)
	{
		acting = true;
		
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation];
			image_index = 0;
		}
	}
	battleState = BattleStatePerformAction;
}

function BattleStatePerformAction()
{
	
	if (currentUser.acting)
	{
		
		if (currentUser.image_index >= currentUser.image_number -1)
		{
			with (currentUser)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(currentAction, "effectSprite"))
			{
				if (currentAction.effectOnTarget == MODE.ALWAYS) || ( (currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1) )
				{
					for (var i = 0; i < array_length(currentTargets); i++)
					{
						instance_create_depth(currentTargets[i].x - 60, currentTargets[i].y -20, currentTargets[i].depth-1, battleEffects, {sprite_index : currentAction.effectSprite});
					}
				}
				else 
				{
					var _effectSprite = currentAction.effectSprite
					if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) effectSprite = currentAction.effectSpriteNoTarget;
					instance_create_depth(x,y,depth-100, battleEffects, {sprite_index : _effectSprite});
				}
				
			}
			currentAction.func(currentUser, currentTargets);
		}
		
	}
	else 
	{
		if(!instance_exists(battleEffects))
		{
			battleWaitTimeRemaining--
			if (battleWaitTimeRemaining == 0)
			{
				battleState = BattleStateVictoryCheck;
			}
		}
	}
}

function BattleStateVictoryCheck()
{
	var _unit = unitTurnOrder[turn];
	
	if (_unit.hp > 0)
	{
		battleState = BattleStateTurnProgression;
	}
	
	else
	{
		instance_activate_object(Player);
		instance_destroy();
	}
}

function BattleStateTurnProgression()
{
	turnCount++;
	turn++;
	
	if (turn > array_length(unitTurnOrder) - 1)
	{
		turn = 0;
		roundCount++;
	}
	battleState = BattleStateSelectAction;
}

battleState = BattleStateSelectAction;