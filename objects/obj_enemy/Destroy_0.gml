/// @desc drops
//test
var rand = random_range(1,10);
var randDrop = random(100);
var i;

for(i = 0; i < rand; i++){
	instance_create_depth(self.x+random_range(-10,10),self.y+random_range(-10,10),0,obj_coin);
}

//adding drops
if(randDrop > 50){
	with(obj_player1){
		addItemToInv(item.health_potion, 1);
	}
}