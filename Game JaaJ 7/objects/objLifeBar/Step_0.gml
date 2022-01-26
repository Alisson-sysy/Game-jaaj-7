//Calcula a porcentagem que vai diminuir da barra de vida de acordo com o dano do golpe/vida total do bos

if(slowLife <= 100){
	colorSlowLife = false
}

if(slowLife > fastLife){
	slowLife -= speedSlowLife
 }