_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_listBox = _display displayCtrl 4111;
lbClear _listBox;
//Custom Players Slide by Andrew_S90 Start
if ((player getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then
{
	{
		if ((_x getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then
		{
			_index = _listBox lbAdd (name _x);
			_listBox lbSetData [_index, netId _x];
			_members = units (group player);
			if (_x isEqualTo player) then
			{
				_listBox lbSetColor [_index, [0/255, 178/255, 205/255, 1]];
			};
			if (_x in _members && _x != player) then //Done like this so you can change the color of group members to like purple or green.
			{
				_listBox lbSetColor [_index, [0/255, 178/255, 205/255, 1]];
			}
			else 
			{
				if !(alive _x) then
				{
					_listBox lbSetColor [_index, [225/255, 65/255, 65/255, 1]];
				};
			};
		};
	}
	forEach allPlayers;
};
//Custom Players Slide by Andrew_S90 End
lbSort [_listBox, "ASC"];
