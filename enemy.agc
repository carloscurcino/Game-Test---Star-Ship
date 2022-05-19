enemy:

SetSpritePosition(inimigo, x, GetSpriteY(inimigo)+10)

if(GetSpriteY(inimigo)>768)
		x = Random(0, 1024)
		SetSpritePosition(inimigo, x, 0)
		pontos=pontos-20
	endif
	

return
