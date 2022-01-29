// Ornamentos
draw_sprite_ext(sprBossLifebarDetails, 0, 160, detailY, 0.4, 0.4, 0, c_white, 1);
draw_sprite_ext(sprBossLifebarDetails, 1, 160, sdetailY, 0.4, 0.4, 0, c_white, 1);

// Lifebar
draw_set_color(colorLifeBg);
draw_rectangle(58, barY - 7.3, 262, barY - 1.3, false);

// Lifebar Fake
if (lifeGrow > 58 and objTitle.eventMoment < 3) {
	draw_set_color(colorLife);
	draw_rectangle(58, 157, objLifeBar.lifeGrow, 164, false);
}

if (objTitle.eventMoment > 2) {
	draw_set_alpha(1);
	
	draw_set_color(colorSlowLife);
	draw_rectangle(58, 157, slowLife, 164, false);

	draw_set_color(colorLife);
	draw_rectangle(58, 157, fastLife, 164, false);
}

draw_sprite_ext(sprBossLifebar, 0, 160, barY, 0.4, 0.4, 0, c_white, 1);
//draw_sprite(sprBossLifebar, 0, 20, barY);
barY += (barTargetY - barY)/15;
detailY += (detailTargetY - detailY)/15;
sdetailY += (sdetailTargetY - sdetailY)/15;