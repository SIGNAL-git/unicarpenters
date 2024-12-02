/// @description Insert description here
// You can write your code in this editor

crediting = false;
initial = false;

function cut(new_sprite)
{
	old_sprite = image_index;
	image_index = new_sprite;
	x = -sprite_width - room_width;
	y -= 20;
}

function arrive()
{	
	x = lerp(x, xstart, 0.05);
	
	if (abs(x - xstart) < 5)
	{
		land();
	}
}

function land()
{
	y = lerp(y, ystart, 0.05);
	if (abs(y - ystart) < 1)
	{
		initial = true;
		if (crediting)
		{
			if (image_index != image_number - 1)
			{
				cut(image_index + 1);
			}
			else
			{
				crediting = false;
				cut(0);
			}
		}
	}
}

function credits()
{
	crediting = true;
}

cut(0);