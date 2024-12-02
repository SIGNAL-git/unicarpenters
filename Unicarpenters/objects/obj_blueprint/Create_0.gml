event_inherited();

state = BLUEPRINT.FRESH;
randomize();
completions = 0;

blueprint =
{
	wood: 0,
	wood_small: 0,
	screws: 0,
	nails: 0
};

status =
{
	wood: 0,
	wood_small: 0,
	screws: 0,
	nails: 0
};

chair = {
	wood: 1,
	wood_small: 4,
	screws: 4,
	nails: 0
}

table = {
	wood: 5,
	wood_small: 0,
	screws: 4,
	nails: 4
}

wall = {
	wood: 6,
	wood_small: 0,
	screws: 0,
	nails: 6
}

furniture_list = [chair, table, wall];

function control()
{
	switch (state)
	{
		case BLUEPRINT.FRESH:
			fresh();
		break;
		
		case BLUEPRINT.BUILDING:
			building();
		break;
		
		case BLUEPRINT.CONNECTING:
			connecting();
		break;
	}
}

function fresh()
{
	image_speed = 0;
	with (obj_fastener)
	{
		set_fastener(spr_blank);
	}
	
	status = {
		wood: 0,
		wood_small: 0,
		screws: 0,
		nails: 0
	}
	
	blueprint = random_furniture();
	
	with (obj_display_wood)
	{
		image_index = other.blueprint.wood - other.status.wood;
	}
	with (obj_display_wood_small)
	{
		image_index = other.blueprint.wood_small - other.status.wood_small;
	}
	
	state = BLUEPRINT.BUILDING;
}

function building()
{
	if (image_index == 3)
	{
		image_speed = 0;
		image_index = 1;
		with (obj_display_wood)
		{
			image_index = other.blueprint.wood - other.status.wood;
			y = ystart;
		}
		with (obj_display_wood_small)
		{
			image_index = other.blueprint.wood_small - other.status.wood_small;
			y = ystart;
		}
	}
	
	if (status.wood >= blueprint.wood && status.wood_small >= blueprint.wood_small)
	{
		var fastener_list = array_shuffle(array_instances(obj_fastener));
		
		var i_nail = 0;
		var i_screw = 0;
		for (i_nail = 0; i_nail < blueprint.nails; i_nail++)
		{
			with (fastener_list[i_nail])
			{
				set_fastener(spr_nail);
			}
		}
		for (i_screw = 0; i_screw < blueprint.screws; i_screw++)
		{
			with (fastener_list[i_screw + i_nail])
			{
				set_fastener(spr_screw);
			}
		}
		
		with (obj_display_wood)
		{
			image_index = other.blueprint.wood - other.status.wood;
			y -= 8;
		}
		with (obj_display_wood_small)
		{
			image_index = other.blueprint.wood_small - other.status.wood_small;
			y -= 8;
		}
		
		image_speed = 0;
		image_index = 0;
		state = BLUEPRINT.CONNECTING;
	}
}

function connecting()
{
	if (status.nails >= blueprint.nails && status.screws >= blueprint.screws)
	{
		with (obj_fastener)
		{
			set_fastener(spr_blank);
		}
		state = noone;
		image_speed = 1;
	}
}

function random_furniture()
{
	return furniture_list[irandom(array_length(furniture_list) - 1)];
}