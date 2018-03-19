/// @desc gun(bulletDirection);
/// @function gun()
/// @param bulletDirection

if(self.gunCooldown == 0 && self.type == "player"){
	var _direction = argument0;
	if(self.bulletType == "standard"){
		
		with(instance_create_depth(self.x,self.y-10,0,obj_bullet)) {
			direction = _direction;speed = 4;friendly = true;image_angle = _direction;
		}
	}else if(self.bulletType =="spread"){
		var i = 0;
		if(_direction > 315 || _direction <= 45){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(0,5),self.y-10,0,obj_bullet)) {
					direction = _direction-random_range(-5,5);speed =5;friendly = true;image_angle = _direction;
				}
				i++;
			}
		}else if(_direction > 45 && _direction <= 135){
			while(i!=10){
				with(instance_create_depth(self.x,self.y+random_range(0,5)-10,0,obj_bullet)) {
					direction = _direction-random_range(-5,5);speed =5;friendly = true;image_angle = _direction;
				}
				i++;
			}
		}else if(_direction > 135 && _direction <= 225){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(-5,0) ,self.y+random_range(-10,0)-10,0,obj_bullet)) {
					direction = _direction-random_range(-5,5);speed =5;friendly = true;image_angle = _direction;
				}
				i++;
			}
		}
		else if(_direction > 225 && _direction <= 315){
			while(i!=10){
				with(instance_create_depth(self.x ,self.y+random_range(-5,0)-10,0,obj_bullet)) {
					direction = _direction-random_range(-5,5);speed =5;friendly = true;image_angle = _direction;
				}
				i++;
			}
		}
	}
	self.gunCooldown = self.gunCooldownRate;

}else if(self.gunCooldown == 0 && self.type == "hostile") {
	var _direction = argument0;
	if(self.bulletType == "standard"){
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = _direction-0;speed =8;friendly = false;image_angle = _direction;
		}
	}else if(self.bulletType == "quad"){
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = _direction-0;speed =8;friendly = false;image_angle = _direction;
		}
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = _direction-90;speed =8;friendly = false;image_angle = _direction;
		}
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = _direction-180;speed =8;friendly = false;image_angle = _direction;
		}
		with(instance_create_depth(self.x,self.y,0,obj_bullet)) {
			direction = _direction-270;speed =8;friendly = false;image_angle = _direction;
		}
	}else if(self.bulletType =="spread"){
		var i = 0;
		if(_direction > 315 || _direction <= 45){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(0,10),self.y,0,obj_bullet)) {
					direction = _direction-random_range(-3,3);speed =5;friendly = false;image_angle = _direction;
				}
			i++;
			}
		}else if(_direction > 45 && _direction <= 135){
			while(i!=10){
				with(instance_create_depth(self.x,self.y+random_range(0,10),0,obj_bullet)) {
					direction = _direction-random_range(-3,3);speed =5;friendly = false;image_angle = _direction;
				}
			i++;
			}
		}else if(_direction > 135 && _direction <= 225){
			while(i!=10){
				with(instance_create_depth(self.x+random_range(-10,0) ,self.y+random_range(-10,0),0,obj_bullet)) {
					direction = _direction-random_range(-3,3);speed =5;friendly = false;image_angle = _direction;
				}
			i++;
			}
		}
		else if(_direction > 225 && _direction <= 315){
			while(i!=10){
				with(instance_create_depth(self.x ,self.y+random_range(-10,0),0,obj_bullet)) {
					direction = _direction-random_range(-3,3);speed =5;friendly = false;image_angle = _direction;
				}
			i++;
			}
		}
	}
	self.gunCooldown = self.gunCooldownRate;
}
