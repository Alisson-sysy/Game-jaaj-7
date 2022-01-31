// Acompanhar
	x = objPlayer.x;
	y = objPlayer.bbox_bottom + 1;
	
if (objGame.gameState == "g") {
	// Timer
	damageTimer++;

	draw_set_alpha(1);

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
	if (not objPlayer.onGround and objPlayer.vSpeed < 0 and objPlayer.state == playerStateFree) {
		sprite_index = sprPlayerJump;
	}

	if (not objPlayer.onGround and objPlayer.vSpeed > 0 and objPlayer.state == playerStateFree) {
		sprite_index = sprPlayerFall;
	}

	if (not objPlayer.onGround and objPlayer.vSpeed < 0.6 and objPlayer.vSpeed > -0.6 and objPlayer.state == playerStateFree) {
		sprite_index = sprPlayerJumpMid;
	}

	// Caminhar
	if (objPlayer.onGround and objPlayer.hSpeed != 0 and objPlayer.state == playerStateFree) {
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

	// Tomando dano
	if (objPlayer.state == playerStateDamage) {
		sprite_index = sprPlayerDamage;
	}

	// Ataque
	if (objPlayer.state == playerStateHit) {
		sprite_index = sprPlayerAttack;
		if (objPlayer.hitStage == 0) image_index = min(image_index, 4);
		if (objPlayer.hitStage == 1) image_index = min(image_index, 6);
		if (objPlayer.hitStage > 1) image_index = min(image_index, 11);
	}

	// Animações acabáveis
	if (image_index > 3 and sprite_index == sprPlayerCrouching) image_speed = 0;
	if (image_index > 2 and sprite_index == sprPlayerDashing) image_speed = 0;
	if (image_index > 1 and sprite_index == sprPlayerJump) image_speed = 0;
	if (image_index > 8 and sprite_index == sprPlayerAttack) image_speed = 0;
	//if (sprite_index == sprPlayerAttack) image_speed = 1;

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
}
