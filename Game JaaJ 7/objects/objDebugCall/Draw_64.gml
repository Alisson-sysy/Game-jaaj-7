//draw_set_color(c_white);
//draw_text(30, 30, "eventMoment: " +string(objWarBoss.eventMoment))
//draw_text(30, 50, "image index: " +string(objWarBoss.image_index))

draw_set_font(fonMiddle);
draw_set_color(c_white);
draw_text(50, 50, objPlayer.x);
draw_text(50, 70, objWarBoss.x);
draw_text(50, 90, abs(objPlayer.x - objWarBoss.x));
draw_text(100, 50, objPlayer.y);
draw_text(100, 70, objWarBoss.y);
draw_text(100, 90, abs(objPlayer.y - objWarBoss.y));
draw_text(160, 90, objWarBoss.choiceCooldown);