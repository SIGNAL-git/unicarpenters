/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_big);

if (countdown > 0)
{
	draw_set_color(c_yellow);
	draw_text(x, y, countdown);
}
else if (timer == 180)
{
	draw_set_color(c_yellow);
	draw_text(x, y, "Go!");
}
else if (timer > 0)
{
	draw_set_color(c_white);
	draw_text(x, y, timer);
}