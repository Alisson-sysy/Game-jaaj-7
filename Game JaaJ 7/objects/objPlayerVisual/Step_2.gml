// Acompanhar
x = objPlayer.x;
y = objPlayer.bbox_bottom + 1;

// Unstretch
if (image_xscale != 1 and image_xscale != -1) {
	image_xscale += (sign(image_xscale) - image_xscale)/10;
	image_yscale += (sign(image_yscale) - image_yscale)/10;
}

// Virar
image_xscale = abs(image_xscale) * objPlayer.facing * -1;

// Resetar
var currentSprite = sprite_index;

image_speed = 1;

// Idle
if (objPlayer.state == playerStateFree and objPlayer.hSpeed == 0) {
	if (objPlayer.onGround and not objPlayer.moveDirection) {
		sprite_index = sprPlayerIdle;
	}
}

// Pulo
if (not objPlayer.onGround and objPlayer.vSpeed < 0) {
	sprite_index = sprPlayerJump;
}

if (not objPlayer.onGround and objPlayer.vSpeed > 0) {
	sprite_index = sprPlayerFall;
}

// Caminhar
if (objPlayer.onGround and objPlayer.hSpeed != 0) {
	sprite_index = sprPlayerRun;
}

// Wall Grab
if (objPlayer.vSpeed > 0 and not objPlayer.onGround and objPlayer.wallGrab) {
	sprite_index = sprPlayerWall;
	
	if (image_index > 1) {
		sprite_index = sprPlayerSlide;
		
	}
}

// Dash
if (objPlayer.state == playerStateDash) {
	sprite_index = sprPlayerDashing;
}

// Crouch
if (objPlayer.state == playerStateCrouch) {
	sprite_index = sprPlayerCrouching;
}

// Animações acabáveis
if (image_index > 3 and sprite_index == sprPlayerCrouching) image_speed = 0;
if (image_index > 2 and sprite_index == sprPlayerDashing) image_speed = 0;
if (image_index > 1 and sprite_index == sprPlayerJump) image_speed = 0;

// Resetar
if (currentSprite != sprite_index) {
	image_index = 0;
	
	// Jump Stretch
	if (sprite_index == sprPlayerJump) {
		image_xscale = 0.5;
		image_yscale = 1.5;
	}
}

// Ground bump
if (wasOnGround != objPlayer.onGround) {
	if (wasOnGround == false) {
		image_xscale = 1.2;
		image_yscale = 0.7;
	}
}