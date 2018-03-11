/// @desc on game start
/// @function initialization()

items();

if(gamepad_is_connected(0)){
	gamepad_set_axis_deadzone(0, 0.15);
}
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);

keyboard_set_map(gp_shoulderrb, vk_space);