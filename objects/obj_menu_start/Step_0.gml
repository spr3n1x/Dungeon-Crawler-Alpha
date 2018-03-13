/// @desc move rooms
if(move_to_game && switchTimer <=0){
	room_goto(room_game);
}else if(move_to_game){
	switchTimer--;
}