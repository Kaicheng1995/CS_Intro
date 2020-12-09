# Machine Learning in Business Analytics
<img src="certificate" width="350">


### Basic Commands
```
1）file.choose（导入数据
2）read.table（False属无标题，直接开数
3）read.csv（True属有标题，排除首行往下数，修改的话用 header = F
4）summary（输出6个结果：min、1/4位、median、mean、3/4位、max
5）command + shift + c（变文本为注释
6）names（更改元素名称
7）colnames、rownames（更改列名称，更改行名称
8）$（筛选元素
9）<- （赋值
10）dim（查看变量的维数
11）mean、median、max、min函数
12）which函数（找出符合输入条件的数据
13）which.max（找出最大数的位置
14）sl[which.max(sl)]   (找出最大数的具体值，这里的sl是定义的条件范围
15）iris[ 行,列 ]    （留空取所有，1:10代表第1至第10，-10代表排除第10，-c(1:10)代表排除第1至第10也可直接输入行、列的名称，如iris[ , "sepal_width"]也可嵌入which函数，如iris[which(sl==5,1), ]
16）list 函数     list（，，，，）输出的时候用[ 1 ]、[ 2 ]、[ 3 ]、[ 4 ]
17) exp()   自然对数的幂
18) ^     幂
19) -> 与-<                   反向赋值
20) vec赋值                 1：10，c（1，2，3），rep，seq
21) rep                        rep（数字，重复次数）
22) seq                       seq（from=，to=，by=） 或 seq（，，length.out=）
23) vec取数                 [  ] 中括号，间隔数据需要用c连接，意为取"第n个数"
24) vec反向取数          如vec [ 9:1 ]
25) all.equal                all.equal(,)检验是否相等
26) vec比较大小        返回值为单个向量的比较结果
27) vec的list函数        如 list ( vec1, vec2, vec3 ),  取List [ [ ] ] 为单个vec
28) 向量内积 %*%、crossprod( , )：a1b1+a2b2+a3b3
29) 向量外积 %o%、tcrossprod( , )、outer( , )  
30) cbind、rbind：按列合并矩阵，按行合并矩阵
31)	matrix：创建矩阵 matrix（x : y, nrow=, ncol=, dimnames = list (c("行1","行2"),c("列1","列2"))。也可以直接用（x: y, nrow=） 
32) plot 函数：plot(x=x轴数据,y=y轴数据,main="标题",sub="子标题"，type="线型",xlab="x轴名称"，ylab="y轴名称"，xlim = c(x轴范围，x轴范围),ylim = c(y轴范围,y轴范围)) 
33) plot函数的type   ："#"点状      "l"线状       "b" 点+线(分离)       "o"点+线(覆盖)    "c" 线 -点	"h"直方线状      "s/S"阶梯状      "n"无形状  
```


### Exercise 0
```
1）install.packages()
2）library()
3）R square、Adjusted R square ：越大越好
4）significance level：显著程度
5）P值：越小越相关
6）Estimate：越大越相关
7）lm函数取log的意义：规范数据
8）stringAsFactors = F，读取数据集时文字不用转换成factor
9）head（）：显示数据集的前几行
10）创建矩阵：matrix（值，行，列）
11）设置目录：除了setwd()还有菜单栏的session
```



### Data Scraping
```
抓取逻辑：单页名称、url > 多页名称、url > 每个子页信息 > 输出数据集 
Rvest：网页数据抓取包 — html_nodes()\html_text()
stringr：字符串工具集 — str_sub()
read_html（）：读取网页
%>%：分布操作
html_nodes（）：读取标签
html_text（）：提取文本
str_sub（）：选取string的一部分
html_attr(href)：读取URL
paste0( , )  ：把多个粘在一起
identical（）：判断是否相等
write.csv（）：输出数据集
for loop
1、定义空向量 c()
2、for loop
3、抓取数据
4、存入空向量
5、检查向量长度 length（）
```

### Exercise 1
```
1）数据集排序
[order（）, ]：排序函数，前面加 - 号代表相反

2）Plot画图相关
ylim=c（，），xlim=c（，）：横纵轴的刻度
points（）：在图中新增点
legend（）：添加图例，x=，y=确定位置，pch代表形状，cex代表大小，intercept代表图例之间的距离
Axis（side=，at=c（，，，），lables=c（，，，）），其中las=2，0垂直或平行

3）数据结果处理
用stargazer的时候，有很多variable时，可以选择性omit=c（）一些变量

4）数据集优化、选取
gsub（）：替代函数，比如gsub(“,” , ””, 数据) 用空白代替逗号
as.numeric（）：转化数字
grepl（）：判断字符是否存在，（“判断关键词”，数据集）返回TRUE/FALSE
ignore.case = T：忽略大小写
根据判断选取特定的行或列，可以用>,<,=，&，|，及其他判断条件。
str_replace_all（数据，“[^[:alnum:]]”，“”）：仅保留数字和字母

5）新增变量
$ + 变量名称 = 赋值

6）查找特定字符的位置
str_locate_all（pattern=，）
```


### Machine Learning
```diff
! Category
1）	Supervised Learning：结果已知
Linear regression
Logistics regression
Probit regression
Support vector machines
Random forest
Neural networks
2）	Unsupervised Learning：结果未知
K-Means clustering
Hidden markov models
3）	Reinforcement Learning


! Prediction methods
1）	Linear regression
假设误差符合正态分布，可以被解释，属于连续型变量。也可以把因变量转化为category variables以解决classification problem，但不太好。

Loss function（对称）

Asymmetric binary loss（不对称）


2）	Logistics regression
因变量只有两个category，假设误差符合type1 extreme value distribution。取0代表baseline，取1代表非baseline。仍属于linear，缺陷是界限单一。

3）	Decision tree
Entropy：判断有序无序
提问是一个熵减的过程，若小于0.1可能就会出现overfitting（问得太细不具备普遍可预测性了），以及没有前瞻性属于local optimization

4）	Random forest
5）	Neural network


! R演练语句
Training set、Validation set、Test set
predict（model，验证集）：pred输出的结果是β*x的乘积之和
mean（（预测值 – 实际值）^2）：mean square error
mean（abs（预测值 –实际值））：mean absolute error

quantile（，0.5）：四分位中位
glm（，family=binary）：run logistics regression
评判logistics优劣以null deviance和residual deviance的差值，越大越好

rpart包
rpart（，method=，cp=）：如果是binary category，method为“class“，如果是连续型为”anova“，cp值代表熵减的最小值

rpart.plot包

attach(mtcars)
par(mfrow=c(1,2))  ：把两张图并列放在一起

prune（，cp=）：修剪决策树
```


### Machine Learning 2
```diff
! Random forest
1）random forest的特点：
•	随机性：子数据集抽取的随机性、每个tree的问题选择的随机性
•	使用范围：continuous、catagory问题都能使用
•	优点：能够避免overfitting
•	缺点：不可解释性（casual random forest这篇文章解释了），以及hyperparameter需要人为调试参数

2）random forest的R实现：
•	randomForest包
•	set.seed（）：保证多次重复运行结果一致
•	importance = T： 衡量变量的重要性
•	importance type1（代表重要性）  type2（代表熵减）
•	ntree默认500个，ntree代表树数，mtry代表问题数
•	用双for loop测试最优结果


! Neural Network
1）neural network的特点：
•	优点：能够反应看不到的关系
•	缺点：运行时间太长，且结果不可解释

2）neural network的R实现：
•	neuralnet包 
•	hidden 代表层数，node代表个数
•	act.fuc
•	Linear.output 代表是否输出线性结果
•	step.max代表迭代次数（防止crash）
•	compute 类似predict


! Sentiment analysis

1）sentiment analysis的特点：
•	scalability、real-time analysis、consistant criteria
•	应用领域：如搜集新产品的 insight等
•	Polarity Analysis两极
•	Valence Shifters：包含转折、否定、加强等
•	Emotion Analysis：可检测出16种不同的情感关键词

2）sentiment analysis的R实现：
•	Sentimentr包
•	sentiment（）
•	element_id：单个元素
•	sentence_id：单个句子
•	sentiment_by（）：按元素不按句子
•	emotion（）
•	emotion_by（）
```


### Advanced Model
```diff
! Model Enemble、catboost学习资料
https://zhuanlan.zhihu.com/p/83426796?utm_source=wechat_session&utm_medium=social&utm_oi=975869084436553728

! Feature Engineering（比较全）：
https://zhuanlan.zhihu.com/p/26444240?utm_source=weibo&utm_medium=social

! label encoding与one hot encoding的区别：
https://zhuanlan.zhihu.com/p/36804348 from 知乎
https://www.cnblogs.com/king-lps/p/7846414.html  from 博客园


! gplearn遗传算法：（创建新特征的一种方式，没看懂）
https://gplearn.readthedocs.io/en/stable/index.html from 官网
https://zhuanlan.zhihu.com/p/31185882 from 知乎解析
https://bigquant.com/community/t/topic/120709 from 案例解析


! lightgbm原理+代码实现+参数
https://blog.csdn.net/huacha__/article/details/81057150
https://blog.csdn.net/lomodays207/article/details/88045852
https://www.jianshu.com/p/3f114699c6ed


! xgboost原理+代码实现+参数
https://blog.csdn.net/qq_19446965/article/details/82079486
https://blog.csdn.net/qq_29831163/article/details/90486802
https://blog.csdn.net/iyuanshuo/article/details/80142730
```
