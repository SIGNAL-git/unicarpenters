/// @description Insert description here
// You can write your code in this editor

if (!ending)
{
	paused = !paused;
}

if (paused)
{
}
else
{
	instance_activate_all();
    surface_free(screen);
    screen = -1;
}