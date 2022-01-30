if (objGame.gameState == "g") {
	script_execute(state);

	invulnerability = max(0, invulnerability - 1);
}