/// @description Insert description here
// You can write your code in this editor

paused = !paused;

if (paused)
{
	mouse_was_locked = window_mouse_get_locked();
	if (mouse_was_locked)
	{
		window_mouse_set_locked(false);
	}
}
else
{
	instance_activate_all();
    surface_free(screen);
    screen = -1;
	if (mouse_was_locked)
	{
		window_mouse_set_locked(true);
	}
}