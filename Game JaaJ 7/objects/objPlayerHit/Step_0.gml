 if (place_meeting(x, y, objEnemyHitbox)) {
	if(objWarBoss.maxLife > 0){
		HitDano();
		instance_destroy(self);
	}
}