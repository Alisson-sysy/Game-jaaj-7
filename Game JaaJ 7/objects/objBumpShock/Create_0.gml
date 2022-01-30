hitbox = noone;
hSpeed = 0.1;
hAcc = 0.05;
facing = 1;

with (instance_create_layer(x, y, "Hitboxes", objEnemyHit)) {
	follow = other;
	xs = 1;
	ys = 2;
	damage = 20;
	destroyOnWall = false;
	destroyTime = 180;
	other.hitbox = self;
}