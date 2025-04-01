battleState();

if (cursor.active)
{
	with (cursor)
	{
		var _keyUp = keyboard_check_pressed(vk_up);
		var _keyDown = keyboard_check_pressed(vk_down);
		var _keyLeft = keyboard_check_pressed(vk_left);
		var _keyRight = keyboard_check_pressed(vk_right);
		var _keyToggle = false;
		var _keyConfirm = false;
		var _keyCancel = false;
		confirmDelay++
		if (confirmDelay > 1)
		{
			var _keyConfirm = keyboard_check_pressed(vk_enter);
			var _keyCancel = keyboard_check_pressed(vk_escape);
			var _keyToggle = keyboard_check_pressed(vk_shift);
		}
		var _moveH = _keyRight - _keyLeft;
		var _moveV = _keyDown - _keyUp;
		
		if (_moveH == -1) targetSide = Battle_Manager.PlayerU;
		if (_moveH == 1) targetSide = Battle_Manager.enemyUnits;
		
		//verify target list
		if (targetSide == Battle_Manager.enemyUnits)
		{
			targetSide = array_filter(targetSide, function(_element, _index)
			{
				return _element.hp > 0;
			});
		}
		
		//move between targets
		if (targetAll == false)
		{
			if (_moveH == 1) targetIndex++;
			if (_moveH == -1) targetIndex--;
			
			//wrap
			var _targets = array_length(targetSide);
			if (targetIndex < 0) targetIndex = _targets - 1;
			if (targetIndex > (_targets - 1)) targetIndex = 0;
			
			// Identify target
			activeTarget = targetSide[targetIndex];
			
			if (activeAction.targetAll == MODE.VARIES) && (_keyToggle)
			{
				targetAll = true;
			}
		}
		else
		{
			activeTarget = targetSide;
			if (ativeAction.targetAll == MODE.VARIES) && (_keyToggle)
			{
				targetAll = false;
			}
		}
		
		if (_keyConfirm)
		{
			with (Battle_Manager) BeginAction(cursor.activeUser, cursor.activeAction, cursor.activeTarget);
			with (battleMenu) instance_destroy();
			active = false;
			confirmDelay = 0;
		}
		
		if (_keyCancel) && (!_keyConfirm)
		{
			with (battleMenu) active = true;
			active = false;
			confirmDelay = 0;
		}
	}
}