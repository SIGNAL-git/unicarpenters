state = BLUEPRINT.FRESH;

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

furniture_list = [chair, table];

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
	
	state = BLUEPRINT.BUILDING;
}

function building()
{
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
		
		state = BLUEPRINT.CONNECTING;
	}
}

function connecting()
{
	if (status.nails >= blueprint.nails && status.screws >= blueprint.screws)
	{
		state = BLUEPRINT.FRESH;
	}
}

function random_furniture()
{
	return furniture_list[irandom(array_length(furniture_list) - 1)];
}