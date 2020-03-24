1+1
exp(2)                       //自然对数e的幂
exp(0)               
pi^2                         //幂
pi^2 -> var1                 //反向赋值
var1

vec1 <- 1:10                 //vec赋值
vec2 <- c(1,2,3)
vec3 <- rep(1,3)             //rep（数字，重复次数）
vec4 <- seq(4,10,1)                  //seq（from=，to=，by=）
vec5 <- seq(4,10,length.out=10)      //seq（from=，to=，length.out=）

vec3[3]               //vec取数[ ]中括号，间隔数据需要用c连接
vec5[2:4]            
vec5[c(2:4)]
vec5[c(2,2,2,4)]

vec5[-4]              //去除数据用 - 
vec5[-(3:4)]
vec5[-c(3,4)]

vec5[9:1]             //反向取数

all.equal(vec5[9:1],c(9,8,7,6,5,4,3,2,1))           //all.equal(,)检验是否相等

vec6 <- c(1,2,3)            
all.equal(vec6,c(1,2,4))
vec6 > c(1,2,1)                     //vec向量比较大小，返回值为单个向量的比较结果

list1 <- list(vec2,vec3,vec4)           //vec的list，取List[[]]为单个vec，同时也能用$筛选
list2 <- list(x=vec2,y=vec3,z=vec4)
list2[[2]]s
list2$y

