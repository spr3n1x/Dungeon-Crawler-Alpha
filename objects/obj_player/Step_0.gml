/// @desc Movement and Collision

if(room_persistent){
	room_set_persistent(room_game,false)
}

xAxis = keyboard_check(vk_right) - keyboard_check(vk_left); //Left and Right Movement
yAxis = keyboard_check(vk_down) - keyboard_check(vk_up); //Up and Down Movement
if(gamepad_is_connected(0)){
	xAxis = gamepad_axis_value(0,gp_axislh);
	yAxis = gamepad_axis_value(0,gp_axislv);
}
var _direction = point_direction(0, 0, xAxis, yAxis); //direction of movement

var _length = Speed * (xAxis !=0 || yAxis != 0); // distance moving

xAxis = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost

yAxis = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost

if(gamepad_is_connected(0) && (gamepad_axis_value(0,gp_axisrv)!=0||gamepad_axis_value(0,gp_axisrh)!=0)){
	_direction = point_direction(0, 0, gamepad_axis_value(0,gp_axisrh), gamepad_axis_value(0,gp_axisrv));
	image_angle = _direction;
	direction = _direction;
} else if (!gamepad_is_connected(0) && (keyboard_check(vk_right)||keyboard_check(vk_left)||keyboard_check(vk_down)||keyboard_check(vk_up))){
	image_angle = _direction;
	direction = _direction;
}
// game end condition
if(hp<=0){
	room_goto(room_main_menu);
}
if(gamepad_button_check(0, gp_shoulderrb)||keyboard_check(vk_space))
{
   gun();
}
// wall collision with walls
if(place_meeting(x+xAxis, y, obj_wall))
{
	// nudging the object up against the wall
	while(!place_meeting(x+sign(xAxis), y, obj_wall))
	{
		x+= sign(xAxis);
	}
	xAxis = 0;
}
// adding xAxis to x for movement
x+=xAxis;
// wall collision with walls
if(place_meeting(x, y+yAxis, obj_wall))
{
	// nudging the object up against the wall
	while(!place_meeting(x, y+sign(yAxis), obj_wall))
	{
		y+= sign(yAxis);
	}
	yAxis = 0;
}
// adding xAxis to x for movement
y+=yAxis;

if(gunCooldown>0){
	gunCooldown--;
}
//-----------------------------------------------------------------------------------------------------

if(invulnerable){
	if (invulnerabilityTimer < room_speed*invulnerabilityTime){
		invulnerabilityTimer++;
	} else{
		invulnerable = false;
	}
}



