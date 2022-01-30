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
			facingUpdate();
			break;
	}
	 
}

function hermesStateSpin() {
	switch (eventMoment) {
		case 0:
			image_speed = 1;
			sprite_index = sprHermesSpinStart;
			
			if (image_index > 20) {
				eventMoment = 1;
				instance_create_layer(x, y, "Particles", objSpinHit);
				with (instance_create_layer(x, y, "Hitboxes", objEnemyHit)) {
					self.follow = noone;
					self.xs = 9;
					self.ys = 9;
					self.destroyTime = 75;
				}
			}
			break;
		
		case 1:
			image_speed = 0;
			image_index = 0;
			sprite_index = sprHermesSpinning;
			image_angle += 57;
			if (spinDuration < 1) {
				eventMoment = 2;
			}
			spinDuration = max(spinDuration - 1, 0);
			break;
		case 2:
			image_angle = 0;
			instance_destroy(objSpinHit);
			sprite_index = sprHermesIdle;
			image_index = 0;
			spinDuration = spinMaxDuration;
			state = hermesStateFree;
			eventMoment = 0;
			facingUpdate();
			break;
	}
}

function hermesStateBump() {
	switch (eventMoment) {
		case 0:
			image_speed = 1;
			sprite_index = sprHermesThrow;
			if (image_index > 18) {
				instance_create_layer(x, y, "Front", objHermesSword);
				eventMoment = 1;
			}
			break;
		
		case 1:
			image_speed = 0;
			if (jumpDelay < 1) {
				eventMoment = 2;
			}
			jumpDelay = max(jumpDelay - 1, 0);
			break;
		case 2:
			image_speed = 0;
			image_index = 0;
			sprite_index = sprHermesSpinning;
			image_angle += 22;
			x += (objHermesSword.x - x)/10;
			y += (objHermesSword.y - y)/10;
			if (objHermesSword.x div 1 == x div 1 and objHermesSword.y div 1 == y div 1) {
				eventMoment = 3;
				instance_destroy(objHermesSword);
				image_angle = 0;
			}
			break;
		case 3:
			image_speed = 1;
			if (image_index > 2) image_index = 3;
			sprite_index = sprHermesBump;
			dropSpeed += 0.8;
			y += dropSpeed;
			if (y > objLevel.groundY) {
				image_speed = 0;
				ScreenShake(10, 10);
				image_index = 4;
				y = objLevel.groundY - 41;
				eventMoment = 4;
				instance_create_layer(x + 24, y + sprite_height/5, "Front", objBumpShock);
				with (instance_create_layer(x - 24, y + sprite_height/5, "Front", objBumpShock)) {
					facing = -1;
				};
			}
			break;
		case 4:
			if (not instance_exists(objBumpShock)) {
				eventMoment = 5;
			}
			break;
		case 5:
			jumpDelay = 20;
			eventMoment = 0;
			state = hermesStateRepos;
			if (objPlayer.x < 336) {
				xTarget = 550;
				yTarget = 120;
			} else {
				xTarget = 122;
				yTarget = 120;
			}
			break;
	}
}

function hermesStateHorDash() {
	switch (eventMoment) {
		case 0:
			image_speed = 1;
			sprite_index = sprHermesPoint;
			if (image_index > 7) {
				image_speed = 0;
				eventMoment = 1;
			}
			break;
		case 1:
			image_speed = 0;
			if (pointDelay < 1) {
				eventMoment = 2;
				image_speed = 1;
				sprite_index = sprHermesHDash;
				image_index = 0;
			}
			pointDelay = max(pointDelay - 1, 0);
			break;
		case 2:
			if (image_index > 10) {
				eventMoment = 3;
				if (x < 336) {
					xTarget = 612;
				} else {
					xTarget = 60;
				}
			}
			break;
		case 3:
			if (image_index > 12) {
				image_index = 12;
				image_speed = 0;
			}
			x += 25 * sign(xTarget - x);
			if (x < 60 or x > 612) {
				eventMoment = 4;
				ScreenShake(10, 10);
				sprite_index = sprHermesStun;
				image_speed = 1;
				image_index = 0;
				x = xTarget;
			}
			break;
		case 4:
			if (image_index > 67) {
				pointDelay = 90;
				eventMoment = 0;
				state = hermesStateRepos;
				if (objPlayer.x < 336) {
					xTarget = 550;
					yTarget = 120;
				} else {
					xTarget = 122;
					yTarget = 120;
				}
			}
			break;
	}
}

function hermesStateVerDash() {
	switch (eventMoment) {
		case 0:
			image_speed = 1;
			sprite_index = sprHermesPointUp;
			if (image_index > 2) {
				image_speed = 0;
				eventMoment = 1;
			}
			break;
		case 1:
			image_speed = 0;
			if (pointDelay < 1) {
				eventMoment = 2;
				image_speed = 1;
				sprite_index = sprHermesVDash;
				image_index = 0;
			}
			pointDelay = max(pointDelay - 1, 0);
			break;
		case 2:
			if (image_index > 10) {
				eventMoment = 3;
				yTarget = 40;
			}
			break;
		case 3:
			if (image_index > 12) {
				image_index = 12;
				image_speed = 0;
			}
			y += 25 * sign(yTarget - y);
			if (y < 60) {
				eventMoment = 4;
				ScreenShake(10, 10);
				sprite_index = sprHermesStun;
				image_speed = 1;
				image_index = 0;
				y = yTarget;
			}
			break;
		case 4:
			if (image_index > 67) {
				pointDelay = 90;
				eventMoment = 0;
				state = hermesStateRepos;
				if (objPlayer.x < 336) {
					xTarget = 550;
					yTarget = 120;
				} else {
					xTarget = 122;
					yTarget = 120;
				}
			}
			break;
	}
}

function hermesStateRepos() {
	switch (eventMoment) {
		case 0:
			image_speed = 0;
			image_index = 0;
			sprite_index = sprHermesSpinning;
			image_angle += 22;
	
			x += (xTarget - x)/6;
			y += (yTarget - y)/3;
			
			if (abs(x - xTarget) < 1) {
				facingUpdate();
				eventMoment = 1;
				yTarget = 245;
			}
			break;
		case 1:
			image_angle = 0;
			sprite_index = sprHermesBump;
			image_index = 3;
			y += (yTarget - y)/3;
			if (abs(y - yTarget) < 1) {
				sprite_index = sprHermesIdle;
				image_index = 0;
				eventMoment = 0;
				state = hermesStateFree;
			}
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

function facingUpdate() {
	if (x < 335) {
		image_xscale = -3;
	} else {
		image_xscale = 3;
	}
}