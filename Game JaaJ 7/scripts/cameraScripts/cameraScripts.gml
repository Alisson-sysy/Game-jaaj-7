function ScreenShake(magnitude, frames) {
	with (objCamera) {
		if (magnitude > shakeRemain) {
			shakeMagnitude = magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = frames;
		}
	}
}

function cameraStateBoss () {
	x = viewWidthHalf + 16;
	y = viewHeightHalf + 16;
	
	// Manter câmera na sala
	//x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
	//y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

	// Screenshake
	x += random_range(-shakeRemain, shakeRemain);
	y += random_range(-shakeRemain, shakeRemain);

	shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

	camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);
}