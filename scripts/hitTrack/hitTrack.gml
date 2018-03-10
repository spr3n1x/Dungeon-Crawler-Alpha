///hitTrack()
if(!self.invulnerable){
	self.hp-=other.dmg;
	other.hp-=self.dmg;
	if(self.type != "projectile"){
		self.invulnerable = true;
		self.invulnerabilityTimer = 0;
	}
	other.invulnerable = true;
	other.invulnerabilityTimer = 0;
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
