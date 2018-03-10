if(self.gunCooldown == 0){
	with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
		direction = other.direction-0;speed =8;
	}
	self.gunCooldown = self.gunCooldownRate;
}