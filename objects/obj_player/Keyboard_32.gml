/// @desc gun shooting
if(gunCooldown == 0){
	with(instance_create_depth(x,y,0,obj_bullet)) {
		direction = other.direction-0;speed =8;
	}
	gunCooldown = gunCooldownRate;
}