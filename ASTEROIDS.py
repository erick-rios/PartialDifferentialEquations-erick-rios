#asteroids game loop
from curses import window
import pygame, sys, os, random, math
from pygame.locals import *
#colors
WHITE = (255,255,255)
RED   = (255, 0 , 0 )
GREEN = ( 0 ,255, 0 )
BLACK = ( 0 , 0 , 0 )
while True:
    draw(window)
    handleInput()
    #game logic
    updateScreen()