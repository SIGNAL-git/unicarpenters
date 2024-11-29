/// @description Insert description here
// You can write your code in this editor

move_x = 0;
move_y = 0;
dir = 0;
move_speed = 0;

collision_list = [obj_wall, obj_wood_machine];

state = ITEM.IDLE;

function control()
{
	 dir = point_direction(0, 0, move_x, move_y);
	 move_speed = point_distance(0, 0, move_x, move_y);
	 
    switch (state)
	{
		case ITEM.IDLE:
			idle();
		break;
		
		case ITEM.KICKED:
			kicked();
		break;
	}
}

/**
 * chill
	slow down to a stop, sometimes bounce off of things too
 */
function idle()
{
    move_x = lerp(move_x, 0, move_accel);
    move_y = lerp(move_y, 0, move_accel);
	
	if (collision_rectangle(x-2, y-2, x+2, y+2, obj_wall, false, true))
	{
		move_x = -move_x;
		move_y = -move_y;
	}
	
	//// Seriously bad situation
	//if (place_meeting(x, y, obj_wall))
	//{
	//	kick(point_direction(x, y, room_center().x, room_center().y), 5);
	//}
}

/**
 * I got freaking kicked man
	Now collide with objects and pass the kick on
 */
function kicked()
{
	move_x = lerp(move_x, 0, move_accel);
    move_y = lerp(move_y, 0, move_accel);
	
	var thing = instance_place(x, y, obj_item);
	if (thing != noone && thing.state != ITEM.KICKED)
	{
		with (thing)
		{
			kick(other.dir, other.move_speed);
		}
		
		move_x = -move_x/2;
		move_y = -move_y/2;
	}
	
	if (collision_rectangle(x-2, y-2, x+2, y+2, obj_wall, false, true))
	{
		move_x = -move_x;
		move_y = -move_y;
	}
	
	if (move_speed <= 0.1)
	{
		state = ITEM.IDLE;
	}
}

/**
 * Kicked, move very far away
 * @param {real} dir Where to go when kicked
 * @param {real} kick_force How hard the kick was
 */
function kick(dir, kick_force)
{
	move_x = lengthdir_x(kick_force, dir);
	move_y = lengthdir_y(kick_force, dir);
	state = ITEM.KICKED;
}

/**
 * Hit by horn, commit some action
 */
function horn()
{
	image_blend = c_orange;
}