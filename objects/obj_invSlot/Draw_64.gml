/// @desc
var iid = obj_player.inventory[# var_slot, 0];
var amount = obj_player.inventory[# var_slot, 1];
var name = global.item_index[# iid, item_stat.name];
var description = global.item_index[# iid, item_stat.description];

//Draw stuff
if (iid != item.none)
{
	draw_sprite(spr_item, iid, x, y); //Draw item sprite
	draw_text(x-string_width(amount)/2, y+16, string(amount)); //Draw item quantity
}