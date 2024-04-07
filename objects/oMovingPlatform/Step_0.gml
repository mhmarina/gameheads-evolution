/// @description Insert description here
// You can write your code in this editor
if(x > initialPos + maxDistance || x < initialPos - maxDistance){
	if(direction == 0){
		direction = 180;
		
	}
	else if(direction == 180){
		direction = 0;
	}
}

if(direction == 0){
	myFace = 1;
}

if(direction == 180){
	myFace = 1;
}

if(place_meeting(x,y+1,oPlayer)){
	oPlayer.x  += myFace*speed;
}














































































































