/// @desc init

dmg = 1; //Damage
hp = 2; //HitPoints
max_hp = 10;
x_speed = 0; //Left and Right Movement
y_speed = 0; //Up and Down Movement
Speed = 1; //speed of movement

aggroRange = 50;
escapeRange = aggroRange * 2;

atkRange = 15;
atkSpeed = 1;
atkCooldown = 0;

state = enemyStates.idle;
show_debug_message("idle state")

shootRange = 45;
gunCooldownRate = room_speed;
gunCooldown = gunCooldownRate;

bulletType = "standard";
friendly = false;

invulnerable = false;
invulnerabilityTime = 1;
invulnerabilityTimer = 0;
permanent = false;
type = "hostile";


// state checks

idleCheck = 0;
idle_time = room_speed*5;
wanderTime = int64(room_speed/2);
wanderTimer = wanderTime;
searchTimePerm = room_speed*3;
searchTime = searchTimePerm;
searchTimer = searchTime;
randDirTimer = 0;
healTime = room_speed;
healTimer = healTime;