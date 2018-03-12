/// @desc Initialization

// making the camera
instance_create_layer(x,y,"Instances", obj_camera);


//Movement Variables
x_speed = 0;
y_speed = 0;
max_speed = 2;
acceleration = 0.3;

//Sprint Modifiers
boost_accel = 0.1;
boost = 1;


//Stats
hp = 7;
dmg = 2;


//Invunerability Variables
invulnerabilityTimer = 0;
invulnerable = false;
invulnerabilityTime = 3;

//type of object
type = "player";

//bullet type
bulletType = "standard";

//
permanent = true;

//
gunCooldownRate = 50;
gunCooldown = 0;

//
friendly = true;

inventory = ds_grid_create(10, 2);
ds_grid_clear(inventory, 0);

equipment = ds_grid_create(6, 2);
ds_grid_clear(equipment, 0);

coins = 0;
var slot = 0;

//while (slot < ds_grid_width(inventory))
//{
//	var inst = instance_create_layer(x+8+(64*slot), y+8, "Instances", obj_invSlot);
//	inst.var_slot = slot;
//	slot ++;
//}

//var inst = instance_create_layer(room_width-16, room_height-16, "Instances", obj_equipmentSlot);
//inst.var_slot = 0;
//var inst = instance_create_layer(room_width-16, room_height-16-32, "Instances", obj_equipmentSlot);
//inst.var_slot = 1;
//var inst = instance_create_layer(room_width-16, room_height-16-32-32, "Instances", obj_equipmentSlot);
//inst.var_slot = 2;
//var inst = instance_create_layer(room_width-16-32, room_height-16, "Instances", obj_equipmentSlot);
//inst.var_slot = 3;
//var inst = instance_create_layer(room_width-16-32, room_height-16-32, "Instances", obj_equipmentSlot);
//inst.var_slot = 4;
//var inst = instance_create_layer(room_width-16-32, room_height-16-32-32, "Instances", obj_equipmentSlot);
//inst.var_slot = 5;

//addItemToInv(item.health_potion, 3);
