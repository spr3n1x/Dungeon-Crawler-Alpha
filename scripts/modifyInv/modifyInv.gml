/// @description Modifies a slot in the inventory. Can add and remove items, and set the item.
/// @function modifyInv(slot, amount, override);
/// @param slot
/// @param amount
/// @param override

//Assign local variables
var slot = argument0;
var amount = argument1;
var override = argument2;

if (override == false) //If it is not overriding current values
{
	 self.inventory[# slot, 1] += amount; //Increase amount by input amount
}
else //If it is overriding current values
{
	self.inventory[# slot, 1] = amount; //Set amount to input amount
}

//Clear slot if the amount is less than or equal to 0
if (self.inventory[# slot, 1] <= 0)
{
	self.inventory[# slot, 0] = item.none;
	self.inventory[# slot, 1] = 0;
}