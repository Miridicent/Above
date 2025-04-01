// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined){
	
	with (instance_create_depth(_x, _y, -99999, battleMenu))
	{
		options = _options;
		description = _description;
		var _optionsCount = array_length(_options);
		visibleOptionsMax = _optionsCount;
		
		
		xmargin = 50;
		ymargin = 50;
		draw_set_font(Dogica);
		heightLine = 12;
		
		if (_width == undefined)
		{
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
			for (var i = 0; i < _optionsCount; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			widthFull = width + xmargin * 2;
		} else widthFull = _width;
		
		if(_height == undefined)
		{
			height = heightLine * (_optionsCount + !(description == -1));
			heightFull = height + ymargin * 2;
		}
		else
		{
			heightFull = _height;
			
			if (heightLine * (_optionsCount + !(description == -1)) > _height - (ymargin*2))
			{
				scrolling = true;
				visibleOptionsMax = (_height - ymargin * 2) div heightLine;
			}
		}
	}

}

function SubMenu(_options)
{
	optionsAbove[subMenuLevel] = options;
	subMenuLevel++;
	options = _options;
	hover = 0;
}

function MenuGoBack()
{
	subMenuLevel--;
	options = optionsAbove[subMenuLevel];
	hover = 0;
}

function MenuSelectAction(_user, _action)
{
	with (battleMenu) acive = false;
	with (Battle_Manager) 
	{
		if (_action.targetRequired)
		{
			with (cursor)
			{
				active = true;
				activeAction = _action;
				targetAll = _action.targetAll;
				if (targetAll == MODE.VARIES) targetAll = true;
				activeUser = _user;
				
				//Which side is targeted by default?
				if (_action.targetEnemyByDefault)
				{
					targetIndex = 0;
					targetSide = Battle_Manager.enemyUnits;
					activeTarget = Battle_Manager.enemyUnits[targetIndex];
				}
				else
				{
					targetSide = Battle_Manager.PlayerU;
					activeTarget = activeUser;
					var _findself = function(_element)
					{
						return (_element == activeTarget)
					}
					targetIndex = array_find_index(Battle_Manager.PlayerU, _findself);
				}
			}
		}
		else
		{
			BeginAction(_user, _action, -1);
			with (battleMenu) instance_destroy();
		}
	}
}