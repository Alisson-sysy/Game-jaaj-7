room_goto(warRoom)

randomize();

var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

gameState = "c";
objTitle.active = true;