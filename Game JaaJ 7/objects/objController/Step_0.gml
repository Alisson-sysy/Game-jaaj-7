// Checar tipo de input
if (checkGamepad()) {
	controllerType = "g";
} else if (keyboard_check(vk_anykey)) {
	controllerType = "k";
}

// Checar inputs
// Direita
keyRight = keyboard_check(vk_right)
or keyboard_check(ord("D"))
or gamepad_button_check(0, gp_padr)
or gamepad_axis_value(0, gp_axislh) > 0

// Esquerda
keyLeft = keyboard_check(vk_left)
or keyboard_check(ord("A"))
or gamepad_button_check(0, gp_padl)
or gamepad_axis_value(0, gp_axislh) < 0

// Baixo
keyDown = keyboard_check(vk_down)
or keyboard_check(ord("S"))
or gamepad_button_check(0, gp_padd)
or gamepad_axis_value(0, gp_axislv) > 0

// Pulo
keyJump = keyboard_check_pressed(ord("Z"))
or keyboard_check_pressed(ord("W"))
or keyboard_check_pressed(vk_up)
or keyboard_check_pressed(vk_space)
or gamepad_button_check_pressed(0, gp_padu)
or gamepad_button_check_pressed(0, gp_face1)

// Golpe
keyHit = keyboard_check_pressed(ord("X"))
or gamepad_button_check_pressed(0, gp_face3)

// Dash
keyDash = keyboard_check_pressed(ord("C"))
or keyboard_check_pressed(vk_shift)
or gamepad_button_check_pressed(0, gp_face2)

// Pause
keyPause = keyboard_check_pressed(vk_enter)
or gamepad_button_check_pressed(0, gp_start)

// Confirm
keyConfirm = keyboard_check_pressed(ord("Z"))
or gamepad_button_check_pressed(0, gp_face1)

// Cancel
keyCancel = keyboard_check_pressed(ord("X"))
or gamepad_button_check_pressed(0, gp_face2)

// Cima
keyMenuUp = keyboard_check_pressed(vk_up)
or gamepad_button_check_pressed(0, gp_padu)

// Baixo
keyMenuDown = keyboard_check_pressed(vk_down)
or gamepad_button_check_pressed(0, gp_padd)