/// @desc Initialization

xAxis = 0; //Left and Right Movement
yAxis = 0; //Up and Down Movement
Speed = 4; //speed of movement

invulnerabilityTimer = 0;
hp = 7;
dmg = 2;
invulnerable = false;
invulnerabilityTime = 3;
removable = false;
gunCooldownRate = 20;
gunCooldown = 0;
type = "player"





keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);