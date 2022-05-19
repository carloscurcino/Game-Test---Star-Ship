
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


#include "moving.agc"
#include "Loader.agc"
#include "shot.agc"
#include "collision.agc"
#include "enemy.agc"
#include "Main Menu.agc"
//#include "gameover.agc"


Gosub loader
gameover=1

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
	
    
    Gosub enemy
	Gosub moving
	Gosub shoot
	Gosub collision
   
	//gosub mainmenu
  
  
    if vidas =0
		gameover=1
		pontos=0
		vidas=3
	endif
	if gameover=1
		cont=cont+1
	endif
	
	if gameover=1
		gosub mainmenu
		cont=cont+1
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

