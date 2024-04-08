
//fullscreen toggle:
//if keyboard_check_pressed(vk_f8){
//	window_set_fullscreen(!window_get_fullscreen());
//}

if(!instance_exists(oPlayer)){
	exit;
}

var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//camera target coordinates:
var _camX = oPlayer.x - _camWidth/2;
var _camY = oPlayer.y - _camHeight/2;
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//set cam coordinate variables
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

if(doorsBroken == 1 && !flag){
	instruction = "Unlocked jump! Hit space to jump.";
	camera_set_view_size(view_camera[0],480,270);
	oPlayer.canJump = true;
}
if(doorsBroken == 2 && !flag){
	instruction = "Unlocked crouch! Press down arrow to crouch.";
	camera_set_view_size(view_camera[0],960,540);
	oPlayer.canCrouch = true;
}
if(doorsBroken == 3 && !flag){
	instruction = "Unlocked float! Repeatedly press space to float.";
	camera_set_view_size(view_camera[0],1920,1080);
	oPlayer.jumpMax = 2;
}

if(oPlayer.coolPoints == 8 && !flag){
	instruction = "Inspire people and collect hearts";
}

if(oBlackScreen.image_alpha == 0 && !flag){
	flag = true;
	alarm[0] = 180;
}










































































































