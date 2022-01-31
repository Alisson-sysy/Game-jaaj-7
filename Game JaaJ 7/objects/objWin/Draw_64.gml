draw_set_color(c_white);
draw_set_alpha(bg2Alpha);
draw_rectangle(0, 0, 1000, 1000, false);
draw_set_alpha(1);

// Texto
draw_set_font(fonDetermination);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(672/2, 250, cstring)