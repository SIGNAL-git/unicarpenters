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
}