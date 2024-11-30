/// @description Insert description here
// You can write your code in this editor

move_x = 0;
move_y = 0;
dir = 0;

collision_list = [obj_wall, obj_wood_machine];

state = PLAYER.IDLE;

function control()
{
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
	set_anim(spr_unicorn_idle);
	
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
	set_anim(spr_unicorn_walk);
    var dir_x = keyboard_check(right_button) - keyboard_check(left_button);
    var dir_y = keyboard_check(down_button) - keyboard_check(up_button);
    
    // Normalize movement
    if (dir_x != 0 || dir_y != 0)
    {
        if (dir - point_direction(0, 0, dir_x, dir_y) > 180)
        {
            dir = lerp(dir, 360+point_direction(0, 0, dir_x, dir_y), move_accel);
        }
		else if (dir - point_direction(0, 0, dir_x, dir_y) < -180)
        {
            dir = lerp(dir, -360+point_direction(0, 0, dir_x, dir_y), move_accel);
        }
        else
        {
            dir = lerp(dir, point_direction(0, 0, dir_x, dir_y), move_accel);
        }
    }
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
    var thing = instance_place(
        x + lengthdir_x(bbox_right-bbox_left, dir+180),
        y + lengthdir_y(bbox_right-bbox_left, dir+180),
        obj_interactable
    );
	
    with (thing)
    {
        kick(other.dir+180, other.kick_force);
    }
	
	state = PLAYER.IDLE;
}

function horn()
{
    var thing = instance_place(
        x + lengthdir_x(bbox_right-bbox_left, dir),
        y + lengthdir_y(bbox_right-bbox_left, dir),
        obj_interactable
    );
	
    with (thing)
    {
        horn();
    }
	
	state = PLAYER.IDLE;
}

function set_anim(spr)
{
	if (sprite_index != spr)
	{
		sprite_index = spr;
	}
}