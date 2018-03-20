/// @desc
/// @function

draw_set_alpha(0.25);
draw_set_colour(c_blue);
draw_circle(x,y,escapeRange,false);
draw_set_alpha(0.25);
draw_set_colour(c_green);
draw_circle(x,y,aggroRange,false);
draw_set_alpha(0.25);
draw_set_colour(c_yellow);
draw_circle(x,y,shootRange,false);
draw_set_alpha(0.25);
draw_set_colour(c_red);
draw_circle(x,y,atkRange,false);
draw_set_alpha(1);
draw_set_color(c_white);

if(image_xscale = 1){
	draw_healthbar(x-sprite_width/2, y-sprite_height-3, x+sprite_width/2, y-sprite_height-1, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true);
}else{
	draw_healthbar(x+sprite_width/2, y-sprite_height-3, x-sprite_width/2, y-sprite_height-1, (hp/max_hp)*100, c_black, c_red, c_lime, 0, true, true);
}
draw_self();