enum item{
	none,
	standardGun,
	shotGun,
	health_potion,
	total
}

enum item_stat
{
	name,
	description,
	type,
	damage,
	Speed,
	hp,
	health_gain,
	total
}

enum item_type

{
	none,
	meleeWeapon,
	rangedWeapon,
	magicWeapon,
	armor,
	healthItem,
	manaItem,
	total
}

global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); //Set every position to 0

//creating a ranged Item
addRangedWeapon(item.standardGun, "Standard Gun", "A Standard Gun.", 1,8,1);
addRangedWeapon(item.standardGun, "Shotgun", "A Spread Shotgun.", 0.5,4,1);

//creating health Item
addHealthItem(item.health_potion, "Health Potion", "It's red. Like normal.", 2);
