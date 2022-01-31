// Quadro
draw_sprite_ext(sprQuadro, 0, 640/2 + 20, 360/2 - 50, 2, 2, 0, c_white, 1);

// Bordas
draw_set_color(make_color_rgb(16, 20, 31));
draw_rectangle(0, 0, 700, 24, false);
draw_rectangle(0, 0, 197, 400, false);
draw_rectangle(0, 200, 700, 400, false);
draw_rectangle(485, 0, 700, 400, false);

// Texto
draw_set_font(fonDetermination);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(640/2, 250, cstring)