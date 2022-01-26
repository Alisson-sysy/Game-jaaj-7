image_xscale = 1;
image_yscale = 2;

if (place_meeting(x, y, objEnemyHitbox)) {
	show_message("bateu!")
	instance_destroy(self);
}