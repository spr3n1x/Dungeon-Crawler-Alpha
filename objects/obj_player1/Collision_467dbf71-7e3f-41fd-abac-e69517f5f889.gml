/// @desc

//show_debug_message("hit by bullet");

hitTrack();
if (instance_exists(other) && other.friendly == false){
	instance_destroy(other);
}