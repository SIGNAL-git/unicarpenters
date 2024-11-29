/// @description Insert description here
// You can write your code in this editor

if (paused)
{
    // Surface does not exist, copy the screen
    if (!surface_exists(screen))
    {
        // Pause game
        if (screen == -1)
        {
            instance_deactivate_all(true);
        }
        
        // Copy the screen
        screen = surface_create(room_width, room_height);
        surface_set_target(screen);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();
    }
    // Surface exists, redraw screen
    else
    {
        draw_surface(screen, 0, 0);
        
        // Faded overlay
        draw_set_alpha(0.5);
        draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
        draw_set_alpha(1);
    }
}