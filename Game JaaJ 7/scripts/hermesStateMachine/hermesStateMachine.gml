// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hermesStateFree() {

}

function hermesStateArrowRain() {
	switch (eventMoment) {
		case 0:
			image_speed = 1;
			sprite_index = sprHermesArrowRainStart;
			if (image_index > 22) {
				image_speed = 0;
				eventMoment = 1;
				summonArrow = 50;
			}
			break;
		case 1:
			image_speed = 0;
			if (summonArrow > 0) {
				instance_create_layer(x, y, "Behind", objArrowRainUp);
				summonArrow = max(summonArrow - 1, 0);
			} else eventMoment = 2;
			
			// Teste criador de colisão
			with (instance_create_layer(x, y, "Behind", objArrowRainUp)) {
				with (instance_create_layer(x, y, "Hitboxes", objEnemyHit)) {
					self.follow = other;
					self.xs = 2;
					self.ys = 5;
				}
				
			}
			
			break;
		case 2:
			image_speed = -1;
			if (image_index < 1) {
				image_speed = 0;
				warningDelay = 60;
				eventMoment = 3;
				// Definir quadrantes da chuva
				target = [];
				// Quadrante atual do player
				array_insert(target, array_length(target), arrowRainQuadrant())
				// 3 Aleatórios
				while (array_length(target) < 4) {
					var r = irandom_range(0, 5);
					if (arrayContains(target, r) < 0) {
						array_insert(target, array_length(target), r);
					}
				}
			
				// Avisar
				for (var i = 0; i < 6; i++) {
					if (arrayContains(target, i) > -1) {
						instance_create_layer(32 + (101 * i) + 50, objLevel.groundY - 3, "Particles", objArrowWarning);
					}
				}
			}
			break;
		case 3:
			warningDelay = max(warningDelay - 1, 0);
			
			if (warningDelay < 1) {
				// Spawnar flechas
				for (var i = 0; i < 6; i++) {
					if (arrayContains(target, i) > -1) {
						// Flechas mãe
						with (instance_create_layer(32 + (101 * i) + 50, 32, "Front", objArrowRainDownLeader)) {
							with (instance_create_layer(x, y, "Hitboxes", objEnemyHit)) {
								self.follow = other;
								self.xs = 6;
								self.ys = 3;
							}
						}
				
						// Flechas suporte
						repeat (20) {
							instance_create_layer(32 + (101 * i) + 50 + random_range(-40, 40), 32, "Front", objArrowRainDown);
						}
					}
				}
				
				instance_destroy(objArrowWarning);
				eventMoment = 4
			}
			
			break;
		case 4:
			eventMoment = 0;
			state = hermesStateFree;
			break;
	}
	 
}

function arrowRainQuadrant() {
	var dist = 999;
	var q = 0;
	
	for (var i = 0; i < 6; i++) {
		var ndist = abs(objPlayer.x - (32 + (101 * i) + 50));
		if (ndist < dist) {
			dist = ndist;
			q = i;
		}
	}
	
	return q;
}