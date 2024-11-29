/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function horn()
{
	var thing = instance_create_depth(x, y, depth, obj_wood_small);
	thing.kick(irandom_range(0, 360), 5);
	thing = instance_create_depth(x, y, depth, obj_wood_small);
	thing.kick(irandom_range(0, 360), 5);
	instance_destroy();
}