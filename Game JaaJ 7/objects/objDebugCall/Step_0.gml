// Evento 1
if (keyboard_check_pressed(ord("1"))) {
	objWarBoss.state = hermesStateArrowRain;
}

if (keyboard_check_pressed(ord("2"))) {
	objWarBoss.state = hermesStateBump;
}

if (keyboard_check_pressed(ord("3"))) {
	objWarBoss.state = hermesStateSpin;
}