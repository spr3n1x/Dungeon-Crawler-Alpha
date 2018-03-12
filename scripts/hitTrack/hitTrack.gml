///hitTrack()
if(!self.invulnerable){
	if(other.type != "projectile" || self.friendly!=other.friendly ){
		self.hp-=other.dmg;
		other.hp-=self.dmg;
		if(other.type != "projectile"){
			other.invulnerable = true;
			other.invulnerabilityTimer = 0;
		}
		if(other.type == "player"){
			self.invulnerable = true;
			self.invulnerabilityTimer = 0;
		}
		show_debug_message(string(self.hp));
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
