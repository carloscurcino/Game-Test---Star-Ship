loader:
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
tiro=CreateSprite(ImagemC) //definir como vetor
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

sx=450
sy=600
atirou=0
SetSpriteVisible(nave, 1)
SetSpriteVisible(inimigo, 1)

return
