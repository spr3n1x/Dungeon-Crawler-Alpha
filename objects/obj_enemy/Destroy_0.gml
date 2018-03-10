/// @desc drops

var rand = random_range(1,10)

var i;

for(i = 0; i < rand; i++){
	instance_create_depth(self.x+random_range(-10,10),self.y+random_range(-10,10),0,obj_coin);
}