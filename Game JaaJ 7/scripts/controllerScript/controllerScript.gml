function checkGamepad() {
	// Verifica se qualquer botão foi pressionado no Gamepad
	for ( var i = gp_face1; i < gp_axisrv; i++ ) {
	    if ( gamepad_button_check( 0, i ) ) return i;
	}
	return false;
}