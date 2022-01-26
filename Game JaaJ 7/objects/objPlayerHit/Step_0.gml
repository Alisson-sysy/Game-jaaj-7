image_xscale = 1;
image_yscale = 2;

if (place_meeting(x, y, objEnemyHitbox)) {
	//objPlayer.damage
	instance_destroy(self);
}