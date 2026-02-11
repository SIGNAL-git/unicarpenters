/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_big);
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
	
	if (!ending)
	{
		draw_text(room_center().x-room_width/3, room_center().y-room_height/3-room_height/10, "Done? Press Q to quit");
		draw_text(room_center().x-room_width/3, room_center().y-room_height/10, "Stuck? Press R to restart");
		draw_text(room_center().x-room_width/3, room_center().y+room_height/3-room_height/10, "Still playing? Press Esc to resume");
	}
	else
	{
		draw_text(room_center().x-room_width/3, room_center().y-room_height/3-room_height/10, "You completed");
		draw_text(room_center().x-room_width/3, room_center().y-room_height/10, string_concat(points, " blueprints"));
		draw_text(room_center().x-room_width/3, room_center().y+room_height/3-room_height/10, "Press Q to quit or R to restart");
	}
}