/// @desc hitTrack()
if(!self.invulnerable){
	if(self.friendly!=other.friendly){
		self.hp-=other.dmg;
		other.hp-=self.dmg;
		if(other.type == "hostile"){
			return true;
		}
		if(other.type == "player"){
			other.invulnerable = true;
			other.invulnerabilityTimer = 0;
		}
		if(self.type == "player"){
			self.invulnerable = true;
			self.invulnerabilityTimer = 0;
		}
		if(other.permanent == false && other.hp <= 0){
			with(other){
				instance_destroy();
			}
		}
		if(self.permanent == false && self.hp <= 0){
			instance_destroy();
		}
	}
}
