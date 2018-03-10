/// @desc Initialization



xAxis = 0; //Left and Right Movement
yAxis = 0; //Up and Down Movement
Speed = 4; //speed of movement
boost = 2;
x = 50;
y = 50;
invulnerabilityTimer = 0;
hp = 7;
dmg = 2;
invulnerable = false;
invulnerabilityTime = 3;
removable = false;
gunCooldownRate = 20;
gunCooldown = 0;
type = "player"

items();

inventory = ds_grid_create(10, 2);
ds_grid_clear(inventory, 0);

coins = 0;
var slot = 0;

while (slot < ds_grid_width(inventory))
 {
 var inst = instance_create_layer(x+8+(64*slot), y+8, "Instances", obj_slot);
 inst.var_slot = slot;
 slot ++;
 }

addItemToInv(item.health_potion, 3);
friendly = true;

bulletType = "spread"

if gamepad_is_connected(0) gamepad_set_axis_deadzone(0, 0.25);

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);

keyboard_set_map(gp_shoulderrb, vk_space);