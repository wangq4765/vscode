'''
修改便签文字和线条粗细
'''
import matplotlib.pyplot as plt
squares=[1,4,16,25]
plt.plot(squares,linewidth=5)#linewidth决定了plot()绘制的线条的粗细
plt.title("Square Numbers",fontsize=24)#函数title给图表指定标题

#函数xlabel()和ylable()让你能够为每条轴设置标题
plt.xlabel("Value",fontsize=14)
plt.ylabel("Square of value",fontsize=14)

#函数tick_params()设置刻度的样式，其中指定的实参将影响x轴和y轴上的刻度(axis="both")
plt.tick_params(axis="both",labelsize=14)

plt.show()