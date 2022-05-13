
// Project: Star Ship 
// Created: 2022-05-03

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Star Ship" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts




CreateSprite(LoadImage("space.png"))

imagemA= LoadImage("nave.png")
ResizeImage(imagemA, 100, 100)
imagemB = LoadImage("ufo.png")
ResizeImage(imagemB, 80, 80)
nave = CreateSprite(imagemA)
inimigo = CreateSprite(imagemB)

x= Random(0, 1024)
SetSpritePosition(nave, 0, 600)
SetSpritePosition(inimigo, x, 0)
SetSpritePosition(nave, 0, 600)


SetSpriteShape(nave, 2)
SetSpriteShape(inimigo, 2)
pontos = 0
vidas=5
cont = 0
SetJoystickScreenPosition(nave, 512, 380)
sx=512
sy=380
do
	PrintC("Pontos: ")
	Print(pontos)
	PrintC("Vidas: ")
	Print(vidas)
    SetSpritePosition(inimigo, x, GetSpriteY(inimigo)+10)
    
   /* if GetRawKeyPressed(39 || 68)
		x#= GetSpriteX(nave)
		SetSpritePosition(nave, x#+1, 600)
	endif*/
    SetSpritePosition(nave, sx, sy)
    sx=sx+GetJoystickX()*15
    sy=sy+GetJoystickY()*15
    
    if GetSpriteCollision(nave, inimigo)=1
		x = Random(0, 1024)
		pontos= pontos+5
		cont = cont+1
		efeitoColid(cont, sx)
		SetSpritePosition(inimigo, x, 0)
	endif
    
    if(GetSpriteY(inimigo)>768)
		x = Random(0, 1024)
		SetSpritePosition(inimigo, x, 0)
		
	endif
	
    If GetSpriteCollision(nave ,inimigo)<> 1
		SetSpriteColor(nave, nave, nave, nave, 255)
		SetSpriteColor(inimigo, inimigo, inimigo, inimigo, 255)
	else
		SetSpriteColor(nave, 255, 0, 0, 255)
		SetSpriteColor(inimigo, 0, 0, 255, 255)
	endif
	
    /*Print("Para iniciar clique na tela")
    Print("Assim a nave seguirá o click do mouse!")
    if( GetPointerPressed() = 1)
		x# = GetPointerX() 
		y# = GetPointerY()
		
		SetSpritePosition(1, x#, y#)
		SetSpriteColor(1,Random(1, 255), Random(1, 255), Random(1, 255), Random(1, 255))
    endif*/
    
    
    Sync()
loop

function efeitoColid(cont, x#)
	
	CreateImageColor(cont, 255, 255, 255, 255)
	CreateParticles(cont, x#+50, 650)
	SetParticlesImage(cont, cont)
	ResetParticleCount(cont)
	SetParticlesDirection(cont, 33, 60)
	SetParticlesLife(cont,2)
	SetParticlesSize(cont, 3)
	SetParticlesAngle(cont, 360)
	SetParticlesFrequency(cont, 24)
	SetParticlesVelocityRange(cont, 1, 4)
	SetParticlesMax(cont, 12)
	
	 //Para colorir as particulas

	 AddParticlesColorKeyFrame(cont,0,0,100,255,0)

	 AddParticlesColorKeyFrame (cont,0.5,0,100,255,255)

	 AddParticlesColorKeyFrame (cont,2.0,150,50,100,255)

	 AddParticlesColorKeyFrame (cont,3.0,0,0,0,0)

	 

	 //Para dar um pause quando pegar um inseto

	sleep(100)
	
	
	  

endfunction
