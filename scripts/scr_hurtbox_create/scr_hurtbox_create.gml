/// @desc Creates Hurtbox for object
/// @function scr_hurtbox_create(xscale, yscale, xoffset, yoffset)
/// @param xscale x scale
/// @param yscale y scale
/// @param xoffset x offset
/// @param yoffset y offset

var hurtbox = instance_create_layer(x,y,"hbox",obj_hurtbox);
hurtbox.owner = id;
hurtbox.image_xscale = argument0;
hurtbox.image_yscale = argument1;
hurtbox.xOffset = argument2;
hurtbox.yOffset = argument3;

return hurtbox;