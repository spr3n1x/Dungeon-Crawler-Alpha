/// @desc init

dmg = 1; //Damage
hp = 1; //HitPoints
x_speed = 0; //Left and Right Movement
y_speed = 0; //Up and Down Movement
Speed = 1; //speed of movement
max_speed = 1;

aggroRange = 100;
escapeRange = aggroRange * 2;

atkRange = 20;
atkSpeed = 1;
atkCooldown = 0;


rangeRanged = 40;
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