/// @description Insert description here
// You can write your code in this editor

function control()
{
    // i do absolutely nothing lol
}

function kick(dir, kick_force)
{
	if (instance_number(obj_item) < item_limit)
	{
		var thing = instance_create_depth(x + sign(room_center().x - x) * sprite_width, y, depth, obj_wood);
		with (thing)
		{
			kick(point_direction(x, y, room_center().x, room_center().y), 5);
		}
	}
}

function horn()
{
	// woooooooo spooky nothing
}