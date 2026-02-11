/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (dropping)
{
	y = lerp(y, ystart, 0.05);
	if (abs(y - ystart) < 5)
	{
		dropping = false;
		land();
	}
}