/// @desc
/// @function

draw_sprite_ext(spr_player_shadow, 0, x ,y+1, 1 ,-.75 , 0, c_white,0.5)
draw_self();
if(image_xscale = 1){
	draw_healthbar(x-sprite_width/2, y-sprite_height-3, x+sprite_width/2, y-sprite_height-1, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true);
}else{
	draw_healthbar(x+sprite_width/2, y-sprite_height-3, x-sprite_width/2, y-sprite_height-1, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true);
}