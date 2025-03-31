// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Action Library
global.actionLibrary = 
{
	attack :
	{
		name : "Attack",
		description : "{0} attacks!",
		subMenu : -1,
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : Attack_effect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.Str + random_range(- _user.Str * 0.25, _user.Str * 0.25));
			BattleChangeHP(_targets[0], -_damage, 0);
		}
	},
	
	dark :
	{
		name: "Dark",
		description: "{0} casts dark!",
		subMenu : "Magic",
		mpCost : 4,
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : Attack_effect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = irandom_range(10, 15);
			BattleChangeHP(_targets[0], - _damage);
		}
	}
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}


//Player Stats
global.Character = 
[
	{
		name: "Vee",
		hp: 20,
		hpMax: 20,
		mp: 20,
		mpMax: 20,
		Str: 5,
		sprites : {idle: MC_Battle, attack: MC_Battle_Attack, down: MC_Battle_Down},
		actions : [global.actionLibrary.attack, global.actionLibrary.dark]
	}
	
]

global.enemies = 
{
	
	Pshade:
	{
		name: "Premature Shade",
		hp: 10,
		hpMax: 10,
		mp: 0,
		mpMax: 0,
		Str: 1,
		sprites : {idle: Premature_Shade_Battle_spr, attack: Premature_Shade_attack},
		actions : [global.actionLibrary.attack],
		xpValue : 5,
		AIscript : function()
		{
			var _action = actions[0];
			var _possibleTargets = array_filter(Battle_Manager.PlayerU, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _target];
		}
		
	}
}

