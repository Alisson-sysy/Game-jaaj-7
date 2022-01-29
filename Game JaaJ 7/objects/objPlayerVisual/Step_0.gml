x = objPlayer.x;
y = objPlayer.bbox_bottom;

var currentSprite = sprite_index;

if (objPlayer.state == playerStateFree) {
	sprite_index = sprPlayerIdle;
	image_index = 1;
}

if (objPlayer.state == playerStateCrouch) {
	sprite_index = sprPlayerCrouch;
	image_speed = 1;
	
	if (image_index > 3) {
		image_index = 4;
		image_speed = 0;
	}
}

// Resetar animação
if (currentSprite != sprite_index) image_index = 0;