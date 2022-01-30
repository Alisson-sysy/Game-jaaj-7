if (objGame.gameState == "d") {
	xTarget = 672/2;
	yTarget = 392/2;
	
	x += (xTarget - x)/20;
	y += (yTarget - y)/20;
	
	bgAlpha += 0.1;
	
	if (bgAlpha > 0.9 and abs(xTarget - x) < 1 and abs(yTarget - y) < 1) {
		show_message("ta no meio")
	}
}