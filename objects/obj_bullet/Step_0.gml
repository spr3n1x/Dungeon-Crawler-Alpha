/// @desc
/// @function

if(distance_to_object(obj_player1) < 10 && friendly == false){
	direction = point_direction(x, y,obj_player1.x, obj_player1.y-10);
}



if (checkCollision(self, obj_level.grid)) {
	instance_destroy();
}