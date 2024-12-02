event_inherited();
control();

if ((state != noone) && (state != BLUEPRINT.CONNECTING))
{
	with (obj_display_wood)
	{
		visible = true;
	}
	with (obj_display_wood_small)
	{
		visible = true;
	}
}
else
{
	with (obj_display_wood)
	{
		visible = false;
	}
	with (obj_display_wood_small)
	{
		visible = false;
	}
}