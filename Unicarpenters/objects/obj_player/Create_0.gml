/// @description Insert description here
// You can write your code in this editor

move_x = 0;
move_y = 0;
dir = 0;

width = (bbox_right-bbox_left)/2;

collision_list = [obj_wall, obj_machine];

state = PLAYER.IDLE;

function control()
{
	update_anim();
	
    switch (state)
	{
		case PLAYER.IDLE:
			idle();
		break;
		
		case PLAYER.WALK:
			walk();
		break;
		
		case PLAYER.KICK:
			kick();
		break;
		
		case PLAYER.HORN:
			horn();
		break;
	}
}

function idle()
{
	move_x = lerp(move_x, 0, move_accel);
    move_y = lerp(move_y, 0, move_accel);
	
	if (keyboard_check(right_button) || keyboard_check(left_button) || keyboard_check(up_button) || keyboard_check(down_button))
	{
		state = PLAYER.WALK;
	}
	if (keyboard_check_pressed(kick_button))
    {
        state = PLAYER.KICK;
    }
	if (keyboard_check_pressed(horn_button))
    {
        state = PLAYER.HORN;
    }
}

function walk()
{
	var dir_x = keyboard_check(right_button) - keyboard_check(left_button);
    var dir_y = keyboard_check(down_button) - keyboard_check(up_button);
    
    if (dir_x != 0 || dir_y != 0)
    {
		dir = point_direction(0, 0, dir_x, dir_y);
    }
	
	// Normalize movement
    move_x = lerp(move_x, abs(dir_x) * lengthdir_x(move_speed, dir), move_accel);
    move_y = lerp(move_y, abs(dir_y) * lengthdir_y(move_speed, dir), move_accel);
	
	if (!(keyboard_check(right_button) || keyboard_check(left_button) || keyboard_check(up_button) || keyboard_check(down_button)))
	{
		state = PLAYER.IDLE;
	}
	if (keyboard_check_pressed(kick_button))
    {
        state = PLAYER.KICK;
    }
	if (keyboard_check_pressed(horn_button))
    {
        state = PLAYER.HORN;
    }
}

function kick()
{
	move_x = 0;
	move_y = 0;
	
	if (image_index == image_number - 1)
	{
		var thing = instance_place(
		        x,
		        y,
		        obj_item
			);
		
		// This is terrible, learn how to make a proper system later
		if (thing == noone)
		{
			thing = instance_place(
		        x + lengthdir_x(width, dir+180),
		        y + lengthdir_y(width, dir+180),
		        obj_item
		    );
		}
		if (thing == noone)
		{
			thing = instance_place(
		        x,
		        y,
		        obj_interactable
			);
		
			if (thing == noone)
			{
				thing = instance_place(
			        x + lengthdir_x(width, dir+180),
			        y + lengthdir_y(width, dir+180),
			        obj_interactable
			    );
			}
		}
	
	    with (thing)
	    {
	        kick(other.dir+180, other.kick_force);
	    }
		
		state = noone;
	}
}

function horn()
{
	move_x = 0;
	move_y = 0;
	
	if (image_index == image_number - 1)
	{
		var thing = instance_place(
			    x,
			    y,
			    obj_item
			);
		
		if (thing == noone)
		{
			thing = instance_place(
		        x + lengthdir_x(width, dir),
		        y + lengthdir_y(width, dir),
		        obj_item
		    );
		}
		if (thing == noone)
		{
			thing = instance_place(
		        x,
		        y,
		        obj_interactable
			);
		
			if (thing == noone)
			{
				thing = instance_place(
			        x + lengthdir_x(width, dir+180),
			        y + lengthdir_y(width, dir+180),
			        obj_interactable
			    );
			}
		}
	
	    with (thing)
	    {
	        horn();
		}
		
		state = noone;
	}
}

function update_anim()
{
	// Flip sprite based on direction
	if (get_direction() == DIR.EAST)
	{
		image_xscale = abs(image_xscale);
	}
	else if (get_direction() == DIR.WEST)
	{
		image_xscale = -abs(image_xscale);
	}
	
	switch (get_direction())
	{
		// Facing sideways
		case DIR.EAST:
		case DIR.WEST:
			switch (state)
			{
				case PLAYER.IDLE:
					set_anim(spr_unicorn_idle_side);
				break;
				
				case PLAYER.WALK:
					set_anim(spr_unicorn_walk_side);
				break;
				
				case PLAYER.KICK:
					set_anim(spr_unicorn_kick_side);
				break;
				
				case PLAYER.HORN:
					set_anim(spr_unicorn_horn_side);
				break;
			}
		break;
		
		// Facing north
		case DIR.NORTH:
			switch (state)
			{
				case PLAYER.IDLE:
					set_anim(spr_unicorn_idle_north);
				break;
				
				case PLAYER.WALK:
					set_anim(spr_unicorn_walk_north);
				break;
				
				case PLAYER.KICK:
					set_anim(spr_unicorn_kick_north);
				break;
				
				case PLAYER.HORN:
					set_anim(spr_unicorn_horn_north);
				break;
			}
		break;
		
		// Facing south
		case DIR.SOUTH:
			switch (state)
			{
				case PLAYER.IDLE:
					set_anim(spr_unicorn_idle_south);
				break;
				
				case PLAYER.WALK:
					set_anim(spr_unicorn_walk_south);
				break;
				
				case PLAYER.KICK:
					set_anim(spr_unicorn_kick_south);
				break;
				
				case PLAYER.HORN:
					set_anim(spr_unicorn_horn_south);
				break;
			}
		break;
	}
}

function set_anim(spr)
{
	if (sprite_index != spr)
	{
		sprite_index = spr;
		image_index = 0;
	}
}

function get_direction()
{
	if (dir >= 45 && dir <= 135)
	{
		return DIR.NORTH;
	}
	else if (dir >= 225 && dir <= 315)
	{
		return DIR.SOUTH;
	}
	else if (dir < 45 || dir > 315)
	{
		return DIR.EAST;
	}
	else if (dir > 135 && dir < 225)
	{
		return DIR.WEST;
	}
}