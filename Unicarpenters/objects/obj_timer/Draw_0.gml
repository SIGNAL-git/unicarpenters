/// @description Insert description here
// You can write your code in this editor

if (countdown > 0)
{
	draw_set_color(c_red);
	draw_text_transformed(x, y, countdown, image_xscale, image_yscale, image_angle);
}
else if (timer == 180)
{
	draw_set_color(c_yellow);
	draw_text_transformed(x, y, "Go!", image_xscale, image_yscale, image_angle);
}
else if (timer > 0)
{
	draw_set_color(c_white);
	draw_text_transformed(x, y, timer, image_xscale, image_yscale, image_angle);
}