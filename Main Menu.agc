mainmenu:

text1=CreateText("Star Ship")
SetTextSize(text1, 100)
SetTextPosition(text1, 334, 180)

text2=CreateText("Clique para iniciar")
SetTextSize(text2, 60)
SetTextPosition(text2, 334, 500)

gosub Hidegamesprites
gosub Showmenutext

repeat
	sync()
until GetPointerPressed()=1 or GetRawKeyPressed(32)

gameover=0
gosub Showgamesprites
gosub Hidemenutext

return


Hidegamesprites:
SetSpriteVisible(nave, 0)
SetSpriteVisible(inimigo, 0)
return

Showgamesprites:
SetSpriteVisible(nave, 1)
SetSpriteVisible(inimigo, 1)
return

Hidemenutext:
SetTextVisible(text1, 0)
SetTextVisible(text2, 0)

return

Showmenutext:
SetTextVisible(text1, 1)
SetTextVisible(text2, 1)

return
