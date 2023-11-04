'''
使用scatter()绘制散点图并设置其样式
'''
import matplotlib.pyplot as plt
x_values=[1,2,3,4,5]
y_values=[1,4,9,16,25]

#c='red'自定义颜色
#edgecolor='none'删除数据点的轮廓
plt.scatter(x_values,y_values,c='red',edgecolor='none',s=100)

plt.title("Square Numbers",fontsize=24)
plt.xlabel("Value",fontsize=14)
plt.ylabel("Square of value",fontsize=14)

plt.tick_params(axis="both",which='major',labelsize=14)

plt.show()