/// @description Insert description here
// You can write your code in this editor

activated = false;
image_speed = 0;

function control()
{
    
}

function set_fastener(spr)
{
	sprite_index = spr;
	activated = false;
}

function kick(dir, kick_force)
{
	if (sprite_index == spr_nail && !activated)
	{
		image_index = 1;
		activated = true;
		with (obj_blueprint)
		{
			status.nails += 1;
		}
	}
}

function horn()
{
	if (sprite_index == spr_screw && !activated)
	{
		image_index = 1;
		activated = true;
		with (obj_blueprint)
		{
			status.screws += 1;
		}
	}
}