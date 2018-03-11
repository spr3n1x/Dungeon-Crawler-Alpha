///hitTrack()
if(!self.invulnerable){
	//test
	if(other.type != "projectile" || self.friendly!=other.friendly ){
		self.hp-=other.dmg;
		other.hp-=self.dmg;
		if(other.type != "projectile"){
			other.invulnerable = true;
			other.invulnerabilityTimer = 0;
		}
		self.invulnerable = true;
		self.invulnerabilityTimer = 0;
		show_debug_message(string(self.hp));
		if(other.removable == true && other.hp <= 0){
			with(other){
				instance_destroy();
			}
		}
		if(self.removable == true && self.hp <= 0){
			instance_destroy();
		}
	}
}
