/// @description Insert description here
// You can write your code in this editor

y = -1000;
dropping = false;
landed = false;

function drop()
{
	dropping = true;
}

function land()
{
	// Push back those players
	var thing = instance_place(x, y, obj_player);
	with (thing)
	{
		x = xstart;
		y = ystart;
	}
	// Hit something, check for more hits
	if (thing != noone)
	{
		land();
	}
	
	
	// No more wood
	thing = instance_place(x, y, obj_item);
	with (thing)
	{
		instance_destroy();
	}
	
	// Hit something, check for more hits
	if (thing != noone)
	{
		land();
	}
	
	landed = true;
}