import numpy as np
from matplotlib import pyplot as plt
import math
import random
import copy
import benchmarks
import KOA
import matplotlib
matplotlib.rcParams['font.sans-serif'] = ['SimHei']  # 设置中文黑体
matplotlib.rcParams['axes.unicode_minus'] = False    # 正确显示负号
from matplotlib.font_manager import FontProperties
font = FontProperties(fname=r"C:\Windows\Fonts\simhei.ttf", size=14)

''' --------------------------- 参数设置 ----------------------------------'''
SearchAgents_no = 50  # 增加种群数量以提高搜索效果
Function_name = 'F24'  # 新的测试函数 - Michalewicz函数
Max_iteration = 1000   # 增加迭代次数以确保收敛

''' ------------------------ 获取测试函数细节 F1~F23 ----------------------------------'''
func_details = benchmarks.getFunctionDetails(Function_name)
lb = func_details[1]
ub = func_details[2]
dim = func_details[3]
fobj = getattr(benchmarks, Function_name) # 获取函数求解

''' ------------------------ 开普勒算法求解 ----------------------------------'''
x = KOA.KOA(fobj, lb, ub, dim, SearchAgents_no, Max_iteration)

''' ------------------------ 求解结果 ----------------------------------'''
IterCurve = x.convergence
Best_fitness = x.best
Best_Pos = x.bestIndividual

''' ------------------------ 输出结果 ----------------------------------'''
print("开始优化Michalewicz函数...")
print(f"搜索空间维度: {dim}")
print(f"搜索范围: [{lb}, {ub}]")
print(f"种群大小: {SearchAgents_no}")
print(f"最大迭代次数: {Max_iteration}")
print("优化中...")

print("\n优化完成!")
print(f"最佳适应度值: {Best_fitness}")
print(f"最佳位置: {Best_Pos}")

''' ------------------------ 绘图 ----------------------------------'''
part1 = ['KOA', 'Michalewicz函数']
name1 = ' '.join(part1)
plt.figure(1)
plt.plot(IterCurve, 'r-', linewidth=2)
plt.xlabel('迭代次数', fontsize='medium', fontproperties=font)
plt.ylabel("适应度值", fontsize='medium', fontproperties=font)
plt.grid()
plt.title(name1, fontsize='large', fontproperties=font)
label = [name1]
plt.legend(label, loc='upper right', prop=font)
plt.savefig('./KOA_Michalewicz.jpg')
plt.show()







