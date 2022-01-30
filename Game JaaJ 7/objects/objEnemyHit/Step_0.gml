// Reajuste de tamanho
image_xscale = xs;
image_yscale = ys;

// Seguir objeto
if (follow != noone) {
	x = follow.x;
	y = follow.y;
}

// Destruir na parede
if (destroyOnWall) {
	if (tilemap_get_at_pixel(tilemap, x, y) == 1) {
		instance_destroy(self);
	}
}

// Destruir com tempo
if (destroyTime < 990) destroyTime = max(destroyTime - 1, 0);
if (destroyTime < 1) instance_destroy(self);

// Dar dano no player
if (place_meeting(x, y, objPlayer) and objPlayer.invulnerability < 1) {
	objPlayer.life -= damage;
	objLifeBarPlayer.fastLife -= damage;
	objPlayer.state = playerStateDamage;
	objPlayer.invulnerability = 90;
	if (not isPersistent) {
		instance_destroy(self);
	}
}