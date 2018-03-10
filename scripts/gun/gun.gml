if(self.gunCooldown == 0 && self.type == "player"){
	if(self.bulletType == "standard"){
		
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = other.direction-0;speed =8;friendly = true;
		}
	}else if(self.bulletType =="spread"){
		var i = 0;
		if(self.direction > 315 || self.direction <= 45){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(0,10),self.y,0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = true;
				}
				i++;
			}
		}else if(self.direction > 45 && self.direction <= 135){
			while(i!=10){
				with(instance_create_depth(self.x,self.y+random_range(0,10),0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = true;
				}
				i++;
			}
		}else if(self.direction > 135 && self.direction <= 225){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(-10,0) ,self.y+random_range(-10,0),0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = true;
				}
				i++;
			}
		}
		else if(self.direction > 225 && self.direction <= 315){
			while(i!=10){
				with(instance_create_depth(self.x ,self.y+random_range(-10,0),0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = true;
				}
				i++;
			}
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
	}else if(self.bulletType =="spread"){
		var i = 0;
		if(self.direction > 315 || self.direction <= 45){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(0,10),self.y,0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = false;
				}
			i++;
			}
		}else if(self.direction > 45 && self.direction <= 135){
			while(i!=10){
				with(instance_create_depth(self.x,self.y+random_range(0,10),0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = false;
				}
			i++;
			}
		}else if(self.direction > 135 && self.direction <= 225){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(-10,0) ,self.y+random_range(-10,0),0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = false;
				}
			i++;
			}
		}
		else if(self.direction > 225 && self.direction <= 315){
			while(i!=10){
				with(instance_create_depth(self.x ,self.y+random_range(-10,0),0,obj_bullet)) {
					direction = other.direction-random_range(-3,3);speed =5;friendly = false;
				}
			i++;
			}
		}
	}
	self.gunCooldown = self.gunCooldownRate;
}
