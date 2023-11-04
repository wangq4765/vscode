#coding=gbk 
import turtle 
from random import choice 
color=["#1E90FF","red","yellow","#1E90FF","green","#FF7F50"] 
def koch(length,size,n): 	
    if(n==0):turtle.fd(length) 	
    else: 		
        for i in [0,60,-120,60]: 			
            turtle.color(choice(color)) 			
            turtle.pensize(size) 			
            turtle.left(i) 			
            koch(length/3,size/3,n-1) 
def main(): 	
    turtle.setup(600,600) 	
    turtle.speed(100) 	
    turtle.penup() 	
    turtle.goto(-200,100) 	
    turtle.pendown() 	
    koch(400,12,3) 	
    turtle.right(120) 	
    koch(400,12,3) 	
    turtle.right(120) 	
    koch(400,2,3) 	
    turtle.hideturtle() 	
    turtle.done() 
main() 
