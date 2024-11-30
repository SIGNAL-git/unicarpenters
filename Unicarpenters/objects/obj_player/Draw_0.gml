/// @description Insert description here
// You can write your code in this editor

if (move_x > 0)
{
	image_xscale = abs(image_xscale);
}
else if (move_x < 0)
{
	image_xscale = -abs(image_xscale);
}

draw_self();