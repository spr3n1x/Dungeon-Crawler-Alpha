/// @description Adds an item and a quantity into the inventory in a valid slot.
/// @function scr_gain_item(item_ID, amount);
/// @param item_ID
/// @param amount

var iid = argument0;
var amount = argument1;

var slot = 0; //A temporary variable to loop through the slots
var inventory_width = ds_grid_width(inventory);

while (slot < inventory_width-1)
{
	//If the tested slot in the inventory is either empty, or contains a matching item id
	if (inventory[# slot, 0] == iid || inventory[# slot, 0] == item.none)
	{
		inventory[# slot, 0] = iid;
		inventory[# slot, 1] += amount;
		return true; //Did set the slot
		exit; //Exit function, because it has set the slot
	}
	slot ++; //Incriment slot to test next position
}
return false; //Did not set slot