timer++;
close = max(close - 1, 0);

if (objPlayer.state == playerStateDeath) {
	objPlayerVisual.sprite_index = sprPlayerDamage;
	objPlayerVisual.image_index = 0;
	
	objPlayer.xTarget = 672/2;
	objPlayer.yTarget = 392/2;
	
	objPlayer.x += (objPlayer.xTarget - objPlayer.x)/20;
	objPlayer.y += (objPlayer.yTarget - objPlayer.y)/20;
	
	bgAlpha += 0.05;
	
	if (bgAlpha > 0.9 and abs(objPlayer.xTarget - objPlayer.x) < 1 and abs(objPlayer.yTarget - objPlayer.y) < 1) {
		deathAlpha += 0.1;
	}
	
	if (deathAlpha > 0.9) {
		objPlayerVisual.sprite_index = sprPlayerDead;
		if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left)) {
			pointer = !pointer;
		}

		// Desistir (nubzin)
		if (pointer and (objController.keyConfirm or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter))) {
			giveup = true;
			close = 70;
		}
		
		if (giveup and close < 1) {
			game_end();
		}
		
		// Resetar
		if (not pointer and (objController.keyConfirm or keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter))) {
			room_restart();
		}
	}
}

