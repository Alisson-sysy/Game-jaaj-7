rotSpeed = 25;
xTarget = 350;
yTarget = 48 + sprite_height/2;

with (instance_create_layer(x, y, "Hitboxes", objEnemyHit)) {
	self.follow = other;
	self.xs = 3;
	self.ys = 3;
	self.destroyTime = 75;
}

image_xscale = 3;
image_yscale = 3;