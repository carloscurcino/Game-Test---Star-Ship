
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

//Loader, carregar imagens e sons
imagemA= LoadImage("nave.png")
ResizeImage(imagemA, 100, 100)
imagemB = LoadImage("ufo.png")
ResizeImage(imagemB, 80, 80)
ImagemC= LoadImage("shot.png")
ResizeImage(ImagemC, 30, 30)
nave = CreateSprite(imagemA)
inimigo = CreateSprite(imagemB)
tiro=CreateSprite(ImagemC)
SetSpriteVisible(tiro, 0)
tirosound=LoadSound("lazer.wav")
explodiu=LoadSound("explosion.wav")


x= Random(0, 1024)
SetSpritePosition(nave, 0, 600)
SetSpritePosition(inimigo, x, 0)
//SetSpritePosition(nave, 0, 600)


SetSpriteShape(nave, 2)
SetSpriteShape(inimigo, 2)
SetSpriteShape(tiro, 2)

pontos = 0
highscore=0
vidas=3
cont = 0
SetJoystickScreenPosition(nave, 512, 380)
sx=450
sy=600
atirou=0
do
	PrintC("Pontos: ")
	Print(pontos)
	PrintC("Vidas: ")
	Print(vidas)
	PrintC("Highscore: ")
	Print(highscore)
	
	if pontos>highscore
		highscore=pontos
	endif
	
    SetSpritePosition(inimigo, x, GetSpriteY(inimigo)+10)
    

    SetSpritePosition(nave, sx, sy)
    sx=sx+GetJoystickX()*15
    sy=sy+GetJoystickY()*15
    
    //Atirar o laser da nave
    if GetRawKeyPressed(32) or GetPointerPressed()=1 and atirou=0
		PlaySound(tirosound)
		xs=GetSpriteX(nave)
		ys=GetSpriteY(nave)
		SetSpriteVisible(tiro, 1)
		SetSpritePosition(tiro, xs, ys)
	   //TENTAR FAZER SAIR MAIS DE UM TIRO
		
		atirou=1
		
	endif
	
	
	if atirou =1
		SetSpritePosition(tiro, xs+35, GetSpriteY(tiro)-10)
	endif
	
	if GetSpriteY(tiro) = 0
		atirou=0
		SetSpritePosition(tiro, 0, 0)
		SetSpriteVisible(tiro, 0)
	endif
	
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
	endif
    
    if(GetSpriteY(inimigo)>768)
		x = Random(0, 1024)
		SetSpritePosition(inimigo, x, 0)
		pontos=pontos-20
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
    /*Print("Para iniciar clique na tela")
    Print("Assim a nave seguirá o click do mouse!")
    if( GetPointerPressed() = 1)
		x# = GetPointerX() 
		y# = GetPointerY()
		
		SetSpritePosition(1, x#, y#)
		SetSpriteColor(1,Random(1, 255), Random(1, 255), Random(1, 255), Random(1, 255))
    endif*/
    if vidas =0
		//gameove() //Aparecer tela de game over
		pontos=0
		vidas=3
	endif
    
    if cont=1000
		cont=0
	endif
    Sync()
loop

function efeitoColid(cont, x#, y#)
	
	CreateImageColor(cont, 255, 255, 255, 255)
	CreateParticles(cont, x#+50, y#)
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

function MainMenu(nave, inimigo)
	repeat
		SetSpriteVisible(nave, 0)
		SetSpriteVisible(inimigo, 0)
		
		Sync()
	until GetPointerPressed()=1
		
	
endfunction
