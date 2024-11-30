/// @description Add wood to blueprint

if (status.wood < blueprint.wood)
{
	instance_destroy(other);
	status.wood += 1;
}
else
{
	other.move_x = -other.move_x;
	other.move_y = -other.move_y;
}