fastLife = max(fastLife, 15);
slowLife = max(slowLife - speedSlowLife, fastLife, 15);

if (fastLife < 24) {
	fastLife = 20;
	objPlayer.state = playerStateDeath;
}