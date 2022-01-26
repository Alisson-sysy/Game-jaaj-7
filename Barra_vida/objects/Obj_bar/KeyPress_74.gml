if(max_life >= 100){	
	dano_golpe = random_range(100, 600)
	porcentagem_vida = (dano_golpe * 100) / life_boos
	max_life_porcentagem = (max_life_initial * porcentagem_vida) / 100
	max_life -= max_life_porcentagem
	show_debug_message("sikm")
}
