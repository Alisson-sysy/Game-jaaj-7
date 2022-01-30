if (objTitle.eventMoment == 3) {
	draw_set_alpha(1);
	
	draw_set_color(colorLifeBg);
	draw_rectangle(20, 12, 128, 18, false);
	
	draw_set_color(colorSlowLife);
	draw_rectangle(20, 12, slowLife, 18, false);

	draw_set_color(colorLife);
	draw_rectangle(20, 12, fastLife, 18, false);

	draw_sprite_ext(sprPlayerLifebar, 0, 15, 10, 0.5, 0.5, 0, c_white, 1)
}