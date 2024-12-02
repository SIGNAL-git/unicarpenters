/// @description Add wood to blueprint

if (status.wood < blueprint.wood)
{
	instance_destroy(other);
	status.wood += 1;
	image_speed = 1;
	
	with (obj_display_wood)
	{
		image_index = other.blueprint.wood - other.status.wood;
		y += 8;
	}
	with (obj_display_wood_small)
	{
		image_index = other.blueprint.wood_small - other.status.wood_small;
		y += 8;
	}
}
else
{
	other.move_x = -other.move_x;
	other.move_y = -other.move_y;
}