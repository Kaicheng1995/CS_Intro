
iris1 <- read.table(file=file.choose())     //用read.table读取数据
file.choose()                               //查找文件路径"/Users/ares/Desktop/科研/iris.csv"

iris2 <- read.csv(file=file.choose(),header=F)   //用read.csv读取数据

summary(iris2)                              //输出各变量的6种结果：min、1.4位、median、mean、3.4位、max

# 1. sepal length in cm
# 2. sepal width in cm
# 3. petal length in cm
# 4. petal width in cm
# 5. class: 
#   -- Iris Setosa
# -- Iris Versicolour
# -- Iris Virginica

names(iris2) <- c("sepal.length","sepal.width","petal.length","petal.width","species")    //assign name

names(iris2)

colnames(iris2)       //查看列名
rownames(iris2)       //查看行名

iris2$sepal.length               //$是name operator，出现了iris2下面的所有sepal.length数值

dim(iris2)                          //查看变量的维数

sl <- iris2$sepal.length       //赋值sl

summary(sl)                       //于是可以用sl来做summary了，还有其他的如  mean、median、max、min都可以用、length数据长度

which(sl==5.1)                     //which函数，找出符合输入条件的数据，这里的结果是符合sl=5.1的位置
which.max(sl)                      //找出最大的那个的位置

sl[which.max(sl)]                  // 外围 sl[ ] 就可以返回具体数值

iris2[ , ]                               // 二维行列，留空格代表展示所有，：代表连续，-代表排除，，代表分别，也可直接加入列名称

iris2[1:10,]
iris2[1:10,-4]
iris2[1:10,-c(1:2)]
iris2[1:10,c(2,5)]
iris2[,"sepal.length"]

iris2[which(ls==5.1),]              //可以和which连用进行筛选


I1 <- iris2[1:100,]
I2 <- iris2[101:150,]

IRIS <- list(I1,I2)                    //list函数，list（，，，)，输出的时候用[1][2][3]的双括号，也能用$调取数据,$可以逐层调取

IRIS[[1]]
IRIS[[2]]
IRIS[[1]]$sepal.length
mean(IRIS[[1]]$sepal.length)    //还可以在前面加函数

