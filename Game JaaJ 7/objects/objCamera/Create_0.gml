/// desc Definir câmeras
cam = view_camera[0];
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;

state = cameraStateBoss;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;