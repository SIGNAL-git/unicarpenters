/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function control()
{
    movement();
    
    if (keyboard_check_pressed(kick_button))
    {
        kick();
    }
}

function kick()
{
    var opposite_dir = dir+180;
    var thing = instance_place(
        x + lengthdir_x(sprite_width/2, opposite_dir),
        y + lengthdir_y(sprite_width/2, opposite_dir),
        obj_interactable
    );
    
    with (thing)
    {
        move_x = lengthdir_x(other.kick_force, opposite_dir);
        move_y = lengthdir_y(other.kick_force, opposite_dir);
    }
}