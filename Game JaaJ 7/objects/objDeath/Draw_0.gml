draw_set_color(make_color_rgb(36, 21, 39));
draw_set_alpha(bgAlpha);
draw_rectangle(0, 0, 1000, 1000, false);
draw_set_alpha(1);

draw_sprite_ext(sprDeathScreen, 0, 16, -24, 1, 1, 0, c_white, deathAlpha);

if (deathAlpha > 0.9) {
	draw_set_color(make_color_rgb(9, 10, 20));
	draw_set_font(fonM6x11);
	draw_set_halign(fa_center);
	draw_text(672/2, 270, "Continuar?");
	draw_text(672/2 - 30, 310, "Sim");
	draw_text(672/2 + 30, 310, "Nao");
	
	draw_set_color(make_color_rgb(235, 237, 233));
	draw_text(672/2, 268, "Continuar?");
	if (pointer == 0) draw_set_color(make_color_rgb(232, 193, 112));
	else draw_set_color(make_color_rgb(235, 237, 233));
	draw_text(672/2 - 30, 308, "Sim");
	if (pointer == 1) draw_set_color(make_color_rgb(232, 193, 112));
	else draw_set_color(make_color_rgb(235, 237, 233));
	draw_text(672/2 + 30, 308, "Nao");
	
	if (giveup) {
		draw_set_color(c_black);
		draw_rectangle(0, 0, 1000, 1000, false);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_font(fonM6x11);
		if (timer % 5 == 0) draw_text(672/2, 392/2 - 40, "Noob XD");
	}
}