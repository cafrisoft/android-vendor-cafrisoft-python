
import pygame
import pdb

import random
import math
import block
import constants

bx=16
by=30

resx = bx*constants.BWIDTH+2*constants.BOARD_HEIGHT+constants.BOARD_MARGIN
resy = by*constants.BHEIGHT+2*constants.BOARD_HEIGHT+constants.BOARD_MARGIN

print("resx=%d" % resx)
print("resy=%d" % resy)

screen = pygame.display.set_mode((resx,resy))

