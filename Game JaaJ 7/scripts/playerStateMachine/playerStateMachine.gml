function playerStateFree () {
	var tilemap = layer_tilemap_get_id(layer_get_id("Collision"));

	// Medidas de controle
	// Está no chão
	if (tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1) != 0
	 or tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1) != 0) {
		onGround = true;
	 } else onGround = false;
	 
	// Atacar
	if (objController.keyHit) {
		instance_create_layer(x + (16 * facing), y, "Instances", objPlayerHit);
	}
	 
	// Agachar
	if (onGround and objController.keyDown) {
		state = playerStateCrouch;
	}
	
	// Dash
	if (objController.keyDash and dashCooldown < 1 and facing != 0) {
		dashDuration = dashMaxDuration;
		state = playerStateDash;
	}
	
	// Reduzir cooldown do dash
	if (dashCooldown and onGround) {
		dashCooldown = 0;
	}
	
	// Movimentação
	moveDirection = objController.keyRight - objController.keyLeft;
	if (moveDirection != 0) {
		facing = moveDirection;
	}
	
	// Está andando pra alguma direção
	hSpeed += hAcceleration * moveDirection
	if (moveDirection == 0) hSpeed = hSpeed div 2;
	
	// Limitar velocidade horizontal
	hSpeed = clamp(hSpeed, -maxSpeed, maxSpeed);
	
	// Gravidade
	if (not onGround) {
		vSpeed += vGravity;
	}
	
	// Limitar velocidade vertical
	vSpeed = clamp(vSpeed, -maxVSpeed, maxVSpeed);
	
	applyCollision();
	
	// Limitar pulos
	if (jumps == 2 and vSpeed > 0) {
		jumps--;
	}
	
	// Resetar pulos
	if (onGround) {
		jumps = 2;
	}
	
	// Pular
	if (objController.keyJump and jumps > 0) {
		jumps--;
		vSpeed = -5;
	}
	
	// Wall grab
	if (wallGrab) {
		vSpeed = clamp(vSpeed, -maxVSpeed, wallGrabSpeed);
		
		if (objController.keyJump) {
			wallJumpFacing = -facing;
			vSpeed = -5;
			hSpeed = 3 * wallJumpFacing;
			wallJumpDelay = 10;
		}
	}
	
	if (wallJumpDelay > 0) {
		vSpeed = -5;
		hSpeed = 3 * wallJumpFacing;
		wallJumpDelay = max(wallJumpDelay - 1, 0)
	}
	
	// Aplicar movimentação
	x += hSpeed;
	y += vSpeed;
}
	
function playerStateCrouch() {
	sprite_index = sprPlayerCrouch;
	
	if (not objController.keyDown) {
		state = playerStateFree;
		sprite_index = sprPlayer;
	}
}

function playerStateDash() {
	sprite_index = sprPlayerDash;
	image_xscale = facing;
	hSpeed = maxSpeed * 3 * facing;
	
	applyCollision();
	
	x += hSpeed;
	
	dashDuration = max(dashDuration - 1, 0);
	
	if (dashDuration < 1) {
		vSpeed = 0;
		hSpeed = 0;
		sprite_index = sprPlayer;
		state = playerStateFree;
		dashCooldown = 1;
	}
}

function applyCollision() {
	var tilemap = layer_tilemap_get_id(layer_get_id("Collision"));
	var bbox_v;
	var bbox_h;
	
	// Bater no chão (vertical)
	if (vSpeed > 0) bbox_v = bbox_bottom; else bbox_v = bbox_top;
	
	if (tilemap_get_at_pixel(tilemap, bbox_left, bbox_v + vSpeed) == 1
	or tilemap_get_at_pixel(tilemap, bbox_right, bbox_v + vSpeed) == 1) {
		y = (bbox_bottom + vSpeed) div 16 * 16;
		y -= sprite_height/2 * sign(vSpeed);
		
		vSpeed = 0;
	}
	
	// Bater no chão (horizontal)
	if (hSpeed > 0) bbox_h = bbox_right; else bbox_h = bbox_left;
	
	if (tilemap_get_at_pixel(tilemap, bbox_h + hSpeed, bbox_top) == 1
	or tilemap_get_at_pixel(tilemap, bbox_h + hSpeed, bbox_bottom) == 1) {
		if (hSpeed < 0) {
			//x = (bbox_right + hSpeed) div 16 * 16;
			//x -= sprite_width/2 * sign(hSpeed);
			
			x = (bbox_left + hSpeed) div 16 * 16 + 16;
			while (tilemap_get_at_pixel(tilemap, bbox_left, y)) {
				x++;
			}
		} else {
			x = (bbox_right + hSpeed) div 16 * 16;
			while (tilemap_get_at_pixel(tilemap, bbox_right, y)) {
				x--;
			}
		}
		
		hSpeed = 0;
	}
	
	// Barrar
	if (objController.keyRight and tilemap_get_at_pixel(tilemap, bbox_right + 1, bbox_top) == 1
	or objController.keyRight and tilemap_get_at_pixel(tilemap, bbox_right + 1, bbox_bottom) == 1) {
		hSpeed = 0;
	}
	
	if (objController.keyLeft and tilemap_get_at_pixel(tilemap, bbox_right - 1, bbox_top) == 1
	or objController.keyLeft and tilemap_get_at_pixel(tilemap, bbox_right - 1, bbox_bottom) == 1) {
		hSpeed = 0;
	}
	
	// Wall Grab
	if (moveDirection != 0 and tilemap_get_at_pixel(tilemap, bbox_right + 1, y) == 1
	or moveDirection != 0 and tilemap_get_at_pixel(tilemap, bbox_left - 1, y) == 1) {
		if (not onGround) wallGrab = true;
	} else {
		wallGrab = false;
	}
}