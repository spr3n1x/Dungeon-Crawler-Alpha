/// @desc
hitTrack();
if(state == enemyStates.idle || state == enemyStates.wander){
	state = enemyStates.search;
	searchTime = searchTime*2;
}
