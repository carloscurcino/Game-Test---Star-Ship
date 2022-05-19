shoot:
 //Atirar o laser da nave
    if GetRawKeyPressed(32) and atirou =0 or GetPointerPressed()=1 and atirou=0
		for t=0 to 5
			PlaySound(tirosound)
			xs=GetSpriteX(nave)
			ys=GetSpriteY(nave)
			SetSpriteVisible(tiro, 1)
			SetSpritePosition(tiro, xs, ys)
	   //TENTAR FAZER SAIR MAIS DE UM TIRO
		next t
		atirou=1
		
	endif
	
	
	if atirou =1
		SetSpritePosition(tiro, xs+45, GetSpriteY(tiro)-10)
	endif
	
	if GetSpriteY(tiro) = 0
		atirou=0
		SetSpritePosition(tiro, 0, 0)
		SetSpriteVisible(tiro, 0)
	endif

return
