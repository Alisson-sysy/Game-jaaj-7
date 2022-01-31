// Invul
if (objGame.gameState == "g" or objGame.gameState == "d" and objTitle.eventMoment > 2) {
	if (objPlayer.invulnerability > 0) {
		if (damageTimer % 4 == 0) {
		
		} else {
			draw_self();
		}
	} else {
		draw_self();
	}
}