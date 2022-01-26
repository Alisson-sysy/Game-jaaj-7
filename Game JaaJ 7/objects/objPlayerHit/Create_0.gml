percentageHitBos = 0
percentegeLifebar = 0

function HitDano(){
	hitRandom = irandom_range(100, 100)
	objWarBoss.maxLife -= hitRandom
	percentageHitBos = (hitRandom * 100) / objWarBoss.totalLife
	percentegeLifebar = (objLifeBar.fullLife * percentageHitBos) / 100
	objLifeBar.fastLife -= percentegeLifebar
	if(objLifeBar.fastLife <= 100){
		objLifeBar.colorLife = false
	}
}