'''扑克牌游戏的界面设计'''
from tkinter import*
class Application(Frame):
    def __init__(self,master=None):
        super().__init__(master)#super()代表的是父类的定义，而不是父类对象
        self.master=master 
        self.pack()
        self.createwidget()
    def createwidget(self):
        '''通过place布局管理器实现扑克牌位置控制'''
        #self.photo = PhotoImage(file="E:\VSCode-win32-x64-1.42.1-1\VS code-workspace\project\puke1.gif")
        #self.puke1 = Label(root,image=self.photo)
        #self.puke1.place(x=10,y=50)
        self.photos = [PhotoImage(file="E:\VSCode-win32-x64-1.42.1-1\VS code-workspace\project\puke"+str(i+1)+".gif") for i in range(10)]
        self.pukes = [Label(self.master,image=self.photos[i]) for i in range(10)]
        for i in range(10):
            self.pukes[i].place(x=40+i*50,y=50)
        #为所有的Labe L增加事件处理
        self.pukes[0].bind_class("Label","<Button-1>",self.chupai)
    def chupai(self,event):
        print(event.widget.winfo_geometry())
        print(event.widget.winfo_y())
        if event.widget.winfo_y()==50:
            event.widget.place(y=30)
        else:
            event.widget.place(y=50)
if __name__=='__main__':
    root=Tk()
    root.geometry("600x270+200+300")
    app=Application(master=root)
    root.mainloop()