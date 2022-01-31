
if (timer % 3 == 0) subs++;
cstring = string_copy(texto, 0, subs);
close = max(close - 1, 0);

if (objLifeBar.fastLife < 60) {
	objGame.gameState = "h"
	objWarBoss.sprite_index = sprHermesDeath;
	objWarBoss.image_index = 0;
	objWarBoss.image_speed = 0;
	objWarBoss.image_angle = 0;
	
	objWarBoss.xTarget = 672/2;
	objWarBoss.yTarget = 392/2;
	
	objWarBoss.x += (objWarBoss.xTarget - objWarBoss.x)/20;
	objWarBoss.y += (objWarBoss.yTarget - objWarBoss.y)/20;
	
	bgAlpha += 0.05;
	
	if (bgAlpha > 0.9 and abs(objWarBoss.xTarget - objWarBoss.x) < 1 and abs(objWarBoss.yTarget - objWarBoss.y) < 1) {
		objWarBoss.image_index = 1;
		bg2Alpha += 0.02;
	}
	
	if (bg2Alpha > 0.99) {
		timer++;
	}
}

