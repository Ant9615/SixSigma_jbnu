# no.1 
# 단일비율검정
prop.test(x=5, # 사건횟수
          n=120,  # 시행횟수
          p=0.12,  # 검정비율
          alternative = c("less"), # 대립가설(왼쪽검정) 
          conf.level = 0.95)  # 신뢰수준


# no.2 
proc1 <- c(32.3, 33.4, 30.1, 36.5, 31.4, 35.0, 31.9, 28.8, 32.9, 31.5, 33.4) # 처리량1
proc2 <- c(31.2, 28.1, 32.4, 30.0, 30.5, 30.2, 28.9, 32.0, 27.0, 29.9) # 처리량2

# 정규성 검정 
library(nortest)
qqnorm(proc1) #시각화(산점도)
qqline(proc1, col=2) #시각화(라인생성)
shapiro.test(proc1) # shapiro-wilk test

qqnorm(proc2)#시각화(산점도)
qqline(proc2, col=2) #시각화(라인생성)
shapiro.test(proc2) # shapiro-wilk test

# 두 표본 모두 정규성 만족하므로 bonett 방법을 이용하여 분산검정을 시행한다.
library(intervcomp)
Bonett.Seier.test(proc1, 
                  proc2, 
                  alternative = c("greater"))