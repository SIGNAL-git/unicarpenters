/// @description Add small wood to blueprint

if (status.wood_small < blueprint.wood_small)
{
	instance_destroy(other);
	status.wood_small += 1;
}
else
{
	other.move_x = -other.move_x;
	other.move_y = -other.move_y;
}