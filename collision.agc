collision:
//Determinar a colisão do tiro com a nave e contar pontos
    if GetSpriteCollision(tiro, inimigo)=1
		PlaySound(explodiu)
		x = Random(0, 1024)
		x#=GetSpriteX(inimigo)
		y#=GetSpriteY(inimigo)
		pontos= pontos+10
		cont = cont+1
		efeitoColid(cont, x#, y#)
		SetSpritePosition(inimigo, x, 0)
		SetSpriteVisible(tiro, 0)
		SetSpritePosition(tiro, 0, 0)
		atirou=0
	endif
	
	//Determinar que quando a nave e o inimigo colidem o player perde vida
	if GetSpriteCollision(nave, inimigo)=1
		SetSpriteColor(nave, 255, 0, 0, 255)
		vidas=vidas-1
		cont=cont+1
		x#=GetSpriteX(nave)
		y#=GetSpriteY(nave)//Adicionar o y no efeitoColid	
		x=Random(1, 1024)
		SetSpritePosition(inimigo, x, 0)
		efeitoColid(cont, x#, y#)
	elseif GetSpriteCollision(nave, inimigo)=0
		SetSpriteColor(nave, nave, nave, nave, 255)
	endif
	
	
	
return
