/// @desc

if(!invulnerable){
	hitPoints-=1;
	invulnerable = true;
	invulnerabilityTimer = 0;
	with(other){
		instance_destroy();
	}
}
show_debug_message(string(hitPoints));