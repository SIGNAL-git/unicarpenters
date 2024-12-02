/// @description Insert description here
// You can write your code in this editor

timer--;
if (timer > 0)
{
	alarm[1] = 60;
}
else
{
	with (obj_blueprint)
	{
		state = BLUEPRINT.TIME;
	}
}