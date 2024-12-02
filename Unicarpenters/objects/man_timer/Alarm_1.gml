/// @description Insert description here
// You can write your code in this editor

timer--;
if (timer > 0)
{
	alarm[1] = 60;
}
else
{
	with (man_pause)
	{
		paused = true;
		ending = true;
	}
}

if (timer == 30)
{
	with (obj_garbage_machine)
	{
		path_start(Path1, 2, path_action_restart, true);
	}
}

if (timer == 90)
{
	with (obj_obstacle_2)
	{
		drop();
	}
}

if (timer == 120)
{
	with (obj_obstacle)
	{
		drop();
	}
}

if (timer == 60)
{
	with (obj_wood_machine)
	{
		if (x < room_center().x/2)
		{
			path_start(Path2, 1, path_action_continue, false);
		}
		if (x > room_center().x/2)
		{
			path_start(Path2, -1, path_action_continue, false);
		}
	}
}