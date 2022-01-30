image_xscale = xs;
image_yscale = ys;

if (place_meeting(x, y, objEnemyHitbox)) {
	if(objWarBoss.maxLife > 0){
		objWarBoss.isHit = 3;
		ScreenShake(3, 2)
		HitDano();
		instance_destroy(self);
	}
}

// Destruir com tempo
if (destroyTime < 990) destroyTime = max(destroyTime - 1, 0);
if (destroyTime < 1) instance_destroy(self);