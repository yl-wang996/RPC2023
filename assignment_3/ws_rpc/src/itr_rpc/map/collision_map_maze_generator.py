#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from PIL import Image, ImageDraw
import sys
import random

class Maze(object):
    def __init__(self, width=35, height=21, recursion_limit=2000):
        self.check_size(width, height)
        self.maze = dict()
        try:
            sys.setrecursionlimit(recursion_limit)
        except Exception as e:
            print(e)

    def check_size(self, width, height):
        # width and height must be odd
        if width % 2 == 0:
            self.width = width + 1
        else:
            self.width = width

        if height % 2 == 0:
            self.height = height + 1
        else:
            self.height = height

    def init_maze(self):
        for x in range(0, self.width):
            self.maze[x] = dict()
            for y in range(0, self.height):
                self.maze[x][y] = 1

    def carve_maze(self, x, y):
        dir = random.randint(0, 3)
        count = 0
        while count < 4:
            dx = 0
            dy = 0
            if dir == 0:
               dx = 1
            elif dir == 1:
               dy = 1
            elif dir == 2:
               dx = -1
            else:
               dy = -1
            x1 = x + dx
            y1 = y + dy
            x2 = x1 + dx
            y2 = y1 + dy
            if x2 > 0 and x2 < self.width and y2 > 0 and y2 < self.height:
               if self.maze[x1][y1] == 1 and self.maze[x2][y2] == 1:
                  self.maze[x1][y1] = 0
                  self.maze[x2][y2] = 0
                  self.carve_maze(x2, y2)
            count = count + 1
            dir = (dir + 1) % 4

    def generate_maze(self):
        random.seed()
        self.maze[1][1] = 0
        try:
            self.carve_maze(1, 1)
        except Exception:
            print('Size of maze is too big!')
            sys.exit(1)
        self.maze[1][0] = 0
        self.maze[self.width - 2][self.height - 1] = 0

class MapDrawer:
    def __init__(self, maze, image_dim_x, image_dim_y):
        self.image_dim_x    = image_dim_x
        self.image_dim_y    = image_dim_y
        self.maze   = maze.maze
        self.maze_dim_x = len(self.maze.values())
        self.maze_dim_y = len(self.maze.keys())

        self.scale_x = self.image_dim_x / self.maze_dim_x
        self.scale_y = self.image_dim_y / self.maze_dim_y
        self.border_x = self.image_dim_x - (self.maze_dim_x*self.scale_x)
        self.border_y = self.image_dim_y - (self.maze_dim_y*self.scale_y)

        self.image = Image.new('1', (self.image_dim_x, self.image_dim_y), 1)
        self.draw = ImageDraw.Draw(self.image)
        self.pixels = self.image.load()
        for y in xrange(self.maze_dim_x):
            for x in xrange(len(self.maze.values())):
                for scaley in xrange(self.scale_y):
                    for scalex in xrange(self.scale_x):
                        if (self.maze[x][y] == 0):
                            self.pixels[(x*self.scale_x)+scalex+(self.border_x/2),(y*self.scale_y)+scaley+(self.border_y/2)] = 0
                        else:
                            self.pixels[(x*self.scale_x)+scalex+(self.border_x/2),(y*self.scale_y)+scaley+(self.border_y/2)] = 1

    def draw_map(self, name):
        self.image.save('prm_'+name+'.png')

if __name__ == "__main__":
    image_dim_x = 1000
    image_dim_y = 1000

    for i in [5,10,20,30,40,50]:
    #for i in [99]:
        target_maze_dim_x   = i
        target_maze_dim_y   = i

        maze = Maze(target_maze_dim_x, target_maze_dim_y)
        maze.init_maze()
        maze.generate_maze()

        map_drawer = MapDrawer(maze, image_dim_x, image_dim_x)
        map_drawer.draw_map(str(target_maze_dim_x)+"_"+str(target_maze_dim_y))
