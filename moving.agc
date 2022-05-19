 moving:
 SetJoystickScreenPosition(nave, 512, 380)
 SetSpritePosition(nave, sx, sy)
    sx=sx+GetJoystickX()*15
    sy=sy+GetJoystickY()*15

//Define o limite onde a nave anda em x e em y 
    if sx<-50
		sx=-50
	elseif sx>970
		sx=970
	endif
	
	if sy<0
		sy=0
	elseif sy>680
		sy=680
	endif
return
