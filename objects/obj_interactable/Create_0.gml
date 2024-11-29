/// @description Insert description here
// You can write your code in this editor

move_x = 0;
move_y = 0;
dir = 0;

collision_list = [obj_wall];

function control()
{
    movement();
}

function movement()
{
    move_x = lerp(move_x, 0, move_accel);
    move_y = lerp(move_y, 0, move_accel);
    
    if (place_meeting(x+2, y, obj_wall) || place_meeting(x-2, y, obj_wall))
    {
        move_x = -move_x;
    }
    if (place_meeting(x, y+2, obj_wall) || place_meeting(x, y-2, obj_wall))
    {
        move_y = -move_y;
    }
}