'''测试Radiobutton组件的基本用法,使用面向对象的方式'''
from tkinter import*
from tkinter import messagebox 
import random
class Application(Frame):
    def __init__(self,master=None):
        super().__init__(master) #super()代表的是父类的定义,而不是父类对象
        self.master = master 
        self.pack()
        self.createWidget()
    def createWidget(self):
        btnText=(("MC","M+","M-","MR"),("C","±","÷","×"),(7,8,9,"－"),(4,5,6,"＋"),(1,2,3,"="),(0,"."))
        Entry(self).grid(row=0,column=0,columnspan=4,pady=10)
        for rindex,r in enumerate(btnText):#enumerate：列举
            for cindex,c in enumerate(r):
                if c=="=":
                    Button(self,text=c,width=2)\
                        .grid(row=rindex+1,column=cindex,rowspan=2,sticky=NSEW)#NSEW：占满空格
                elif c==0:
                    Button(self,text=c,width=2)\
                        .grid(row=rindex+1,column=cindex,columnspan=2,sticky=NSEW)
                elif c==".":
                    Button(self,text=c,width=2)\
                        .grid(row=rindex+1,column=cindex+1,sticky=EW)
                else:
                    Button(self,text=c,width=2)\
                        .grid(row=rindex+1,column=cindex,sticky=EW)
if __name__ == "__main__":
    root=Tk()
    root.geometry("200x230+200+300")
    app=Application(master=root)
    root.mainloop()