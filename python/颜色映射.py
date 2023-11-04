'''
使用颜色映射
'''
import matplotlib.pyplot as plt

x_values=list(range(1,1001))
y_values=[x**2 for x in x_values]

#将参数c设置成一个y值列表，并使用参数cmap告诉pyplot使用哪个颜色映射，y值较小的点显示为浅蓝色，并将y值较大的点显示为深蓝色
plt.scatter(x_values,y_values,c=y_values,cmap=plt.cm.Blues,edgecolors="none",s=40)

plt.show()