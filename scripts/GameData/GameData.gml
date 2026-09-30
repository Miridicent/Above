// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Action Library

//LevelMulti = 0;


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
	
	Hevattack :
	{
		name : "Heavy Attack",
		description : "{0} attacks Hard!",
		subMenu : -1,
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : Attack_effect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.Str + random_range(- _user.Str * 0.5, _user.Str * 0.5));
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
		userAnimation : "cast",
		effectSprite : Dark_Effect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = irandom_range(10, 15);
			BattleChangeHP(_targets[0], - _damage);
			BattleChangeMP(_user, - mpCost);
		}
	},
	
	darker :
	{
		name: "Darker",
		description: "{0} casts dark!",
		subMenu : "Magic",
		mpCost : 8,
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation : "cast",
		effectSprite : Dark_Effect,
		effectOnTarget : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = irandom_range(20, 30);
			BattleChangeHP(_targets[0], - _damage);
			BattleChangeMP(_user, - mpCost);
			
		}
	},
	
	light :
	{
		name: "Light",
		description: "{0} casts light!",
		subMenu : "Magic",
		mpCost : 3,
		targetRequired : true,
		targetEnemyByDefault : false,
		targetAll : MODE.NEVER,
		userAnimation : "cast",
		effectSprite : noone,
		effectOnTarget : MODE.ALWAYS,
		func : function (_user, _targets)
		{
			var _heal = irandom_range(10, 15);
			BattleChangeHP(_targets[0], _heal);
			BattleChangeMP(_user, - mpCost);
			if (_user.hp > _user.hpMax)
			{
				_user.hp = _user.hpMax;
			}
		}
		
	},
	
	regen :
	{
		name: "Regen",
		description: "{0} used Regen",
		subMenu : -1,
		mpCost : 3,
		targetRequired : true,
		targetEnemyByDefault : false,
		targetAll : MODE.NEVER,
		userAnimation : "cast",
		effectSprite : noone,
		effectOnTarget : MODE.ALWAYS,
		func : function (_user, _targets)
		{
			var _heal = irandom_range(5, 10);
			BattleChangeHP(_targets[0], _heal);
			BattleChangeMP(_user, - mpCost);
			if (_user.hp > _user.hpMax)
			{
				_user.hp = _user.hpMax;
			}
		}
		
	},
	
	escape :
	{
		name: "Escape",
		description: "",
		subMenu : -1,
		targetRequired : false,
		targetEnemyByDefault : false,
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : Attack_effect,
		effectOnTarget : MODE.ALWAYS,
		func : function ()
		{
			instance_destroy(Battle_Manager);
			instance_activate_object(Player);
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
		Level: 1,
		xp: 0,
		xptonext: 10,
		hp: 20,
		hpMax: 20 /*+ LevelMulti*/,
		mp: 20,
		mpMax: 20 /*+ LevelMulti*/,
		Str: 5 /*+ LevelMulti*/,
		sprites : {idle: MC_Battle, attack: MC_Battle_Attack, down: MC_Battle_Down, cast: MC_Battle_Cast},
		actions : [global.actionLibrary.attack, global.actionLibrary.dark, global.actionLibrary.light, global.actionLibrary.escape]
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
		
	},
	
	Penemy:
	{
		name: "Practice Orb",
		hp: 5,
		hpMax: 5,
		mp: 0,
		mpMax: 0,
		Str: 1,
		sprites: {idle: Practice_Orb_battle, attack: Practice_Orb_Battle_atk},
		actions: [global.actionLibrary.attack],
		xpValue: 1,
		AIscript: function()
		{
			var _action = actions[0];
			var _possibleTargets = array_filter(Battle_Manager.PlayerU, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _target];
		}
		
	},
	
	Shade_construct:
	{
		name: "Shade Construct",
		hp: 8, 
		hpMax: 8,
		mp: 0,
		mpMax: 0,
		Str: 3,
		sprites: {idle: Shade_Construct_battle_spr, attack: Shade_Construct_battle_spr},
		actions: [global.actionLibrary.attack],
		xpValue: 5,
		AIscript: function()
		{
			var _action = actions[0];
			var _possibleTargets = array_filter(Battle_Manager.PlayerU, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _target];
		}
	},
	
	Ruin_boss:
	{
		name: "Frenzied Shade",
		hp: 20,
		hpMax: 20,
		mp: 10,
		mpMax: 10,
		Str: 6,
		sprites: {idle: Ruin_boss_Battle_spr, attack: Ruin_Boss_Battle_attack_spr},
		actions: [global.actionLibrary.attack, global.actionLibrary.Hevattack, global.actionLibrary.regen],
		xpValue: 200,
		AIscript: function()
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
	
	
	
	
	
	


