library(SixSigma)
library(qcc)
camshft <- read.csv('C:/Users/user/Desktop/비대면/6시그마/camshaft.CSV')
View(camshft)

shapiro.test(camshft$Supp2) # h0 기각할 수 없음 
supp2 <- camshft$Supp2

sample_size <- 5
n_of_sample <- length(supp2)/sample_size
sample <- rep(1:n_of_sample, each = sample_size) # 부분군 크기만큼 상응하는 데이터를 할당함
# 
df <- data.frame(supp2, sample)
View(df)
# with은 df or list 내 field를 field 이름만으로 접근할 수 있게 해주는 함수임, 데이터 환경에서 주어진 표현식 평가
supp2 <- with(df, qcc.groups(supp2, sample))
supp2_unit <- "unit X"
xbar <- qcc(supp2, type='xbar', data.name = supp2_unit)
process.capability(xbar, spec.limits = c(596,604))
# ss.ca.cp(camshft$Supp2, LSL = 599, USL = 601)

supp2_sd<-sd(camshft$Supp2)
supp2_sd
(0.8*(3*supp2_sd))
