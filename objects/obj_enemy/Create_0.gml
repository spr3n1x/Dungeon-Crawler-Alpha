/// @desc init

dmg = 1; //Damage
hp = 1; //HitPoints
maxhp = 1;
x_speed = 0; //Left and Right Movement
y_speed = 0; //Up and Down Movement
Speed = 1; //speed of movement

aggroRange = 50;
escapeRange = aggroRange * 2;

atkRange = 20;
atkSpeed = 1;
atkCooldown = 0;

state = enemyStates.idle;

shootRange = 40;
gunCooldownRate = 1;
gunCooldown = 0;

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
wanderTimer = 0;
wanderTime = int64(room_speed/2);
searchTimer = 0;
searchTime = room_speed*3;
wanderDir = 0;