chair = {
	wood: 5,
	short_wood: 4,
	screws: 4
}

furniture_list = [chair];

function random_furniture()
{
	return furniture_list[irandom(array_length(furniture_list) - 1)];
}