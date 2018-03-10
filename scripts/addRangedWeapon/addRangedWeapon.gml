/// @description addRangedWeapon(item_ID, name, description, damage, speed, hp);
/// @function scr_add_weapon
/// @param item_ID
/// @param name
/// @param description
/// @param damage
/// @param speed
/// @param hp

var iid = argument0;
global.item_index[# iid, item_stat.name] = argument1;
global.item_index[# iid, item_stat.description] = argument2;
global.item_index[# iid, item_stat.damage] = argument3;
global.item_index[# iid, item_stat.Speed] = argument4;
global.item_index[# iid, item_stat.hp] = argument5;

global.item_index[# iid, item_stat.type] = item_type.rangedWeapon;