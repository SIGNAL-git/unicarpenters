/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collision_list = [obj_wall, obj_wood_machine];

function control()
{
    movement();
    
    if (keyboard_check_pressed(kick_button))
    {
        kick();
    }
	if (keyboard_check_pressed(horn_button))
    {
        horn();
    }
}

function kick()
{
    var thing = instance_place(
        x + lengthdir_x(sprite_width, dir+180),
        y + lengthdir_y(sprite_width, dir+180),
        obj_interactable
    );
	
    with (thing)
    {
        kick(other.dir+180, other.kick_force);
    }
}

function horn()
{
    var thing = instance_place(
        x + lengthdir_x(sprite_width, dir),
        y + lengthdir_y(sprite_width, dir),
        obj_interactable
    );
	
    with (thing)
    {
        horn();
    }
}