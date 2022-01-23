function playerStateFree(){
	var tilemap = layer_tilemap_get_id(layer_get_id("Collision"));
	var bbox_v;
	var bbox_h;
	
	// Medidas de controle
	// Está no chão
	if (tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1) != 0
	 or tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1) != 0) {
		onGround = true;
	 } else onGround = false;
	
	// Movimentação
	moveDirection = objController.keyRight - objController.keyLeft;
	
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
			x = (bbox_right + hSpeed) div 16 * 16;
			x -= sprite_width/2 * sign(hSpeed);
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
	
	// Pular
	if (objController.keyJump) {
		vSpeed = -5;
	}
	
	// Aplicar movimentação
	x += hSpeed;
	y += vSpeed;
}