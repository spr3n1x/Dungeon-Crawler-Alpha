/// @desc hits



if(!self.invulnerable){
	self.hp-=other.dmg;
	other.hp-=self.dmg;
	self.invulnerable = true;
	self.invulnerabilityTimer = 0;
}
if(other.permanent == false && other.hp <= 0){
	with(other){
		instance_destroy();
	}
}