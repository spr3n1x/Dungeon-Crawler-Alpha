/// @desc press button
if(can_press){
	var inst = instance_create_layer(x,y,"clicked",obj_continue_click);
	inst.x = x;
	inst.y = y;
	inst.image_xscale = 3.5;
	inst.image_yscale = 3.5;
}
