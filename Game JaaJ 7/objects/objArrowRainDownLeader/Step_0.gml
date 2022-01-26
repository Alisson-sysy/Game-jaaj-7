y += vSpeed;

if (y + vSpeed > objLevel.groundY) {
	vSpeed = 0;
	y = objLevel.groundY;
}

if (vSpeed < 1) {
	durability = max(durability - 1, 0);
	image_alpha = 1 - (1 - (durability/120));
}