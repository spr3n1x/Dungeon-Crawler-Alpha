/// @desc
/// @function

target = obj_player1;
width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

scale = width / view_get_wport(0);
show_debug_message(scale);