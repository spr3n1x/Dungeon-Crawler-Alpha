if(self.gunCooldown == 0 && self.type == "player"){
	if(self.bulletType == "standard"){
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = other.direction-0;speed =8;friendly = true;
		}
	}
	self.gunCooldown = self.gunCooldownRate;
}else if(self.gunCooldown == 0) {
	if(self.bulletType == "standard"){
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = other.direction-0;speed =8;friendly = false;
		}
	}else if(self.bulletType == "quad"){
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = other.direction-0;speed =8;friendly = false;
		}
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = other.direction-90;speed =8;friendly = false;
		}
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = other.direction-180;speed =8;friendly = false;
		}
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = other.direction-270;speed =8;friendly = false;
		}
	}
	self.gunCooldown = self.gunCooldownRate;
}
