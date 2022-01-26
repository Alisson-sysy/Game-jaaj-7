if(max_life <= 100){
	color_life = false
}

if(slow_life <= 100){
	color_slow_life = false
}

if(slow_life > max_life){
	slow_life -= speed_slow_life
}