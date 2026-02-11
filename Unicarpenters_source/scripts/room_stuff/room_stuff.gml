function room_center()
{
	return {x: room_width/2, y: room_height/2}
}

function array_instances(obj)
{
	var list_obj = [];
	
	for (var i = 0; i < instance_number(obj); i++)
	{
		array_push(list_obj, instance_find(obj, i));
	}
	
	return list_obj;
}