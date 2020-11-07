library(qcc)
library(dplyr)

"""
데이터프레임 생성 및 확인
"""
shrinkage <- c(2.9, 2.1, 3.1, 3.5, 3.1,3.8, 5.2, 4.2, 4.6, 5.9, 6.2, 5.6, 6.4, 6.5, 7.3)
tem_level <- c('A1','A1','A1','A2','A2','A2','A3','A3','A3','A4','A4','A4','A5','A5','A5')
camfiber <- data.frame(tem_level,shrinkage) 
str(camfiber)
head(camfiber)
tail(camfiber)

# 요약통계량
tapply(camfiber$shrinkage, camfiber$tem_level, summary)

# 상자그림
boxplot(shrinkage~tem_level, 
        main ="화학섬유 온도 수축률",
        xlab = "factor",
        ylab = "수축률")

# 정규성 검정 
library(nortest)

a1 <- camfiber %>% 
  filter(tem_level=='A1') # 각 요인별로 필터링
a2 <- camfiber %>% 
  filter(tem_level=='A2')
a3 <- camfiber %>% 
  filter(tem_level=='A3')
a4 <- camfiber %>% 
  filter(tem_level=='A4')
a5 <- camfiber %>% 
  filter(tem_level=='A5')

shapiro.test(a1$shrinkage)
shapiro.test(a2$shrinkage)
shapiro.test(a3$shrinkage)
shapiro.test(a4$shrinkage)
shapiro.test(a5$shrinkage)

# 등분산검정
"""
정규성 검정에서 각 수준이 정규성을 만족하는 것을 확인하였으므로 bartlett방법을 이용한 등분산 검정을 이용한다. 
"""
bartlett.test(shrinkage~tem_level, camfiber) # (수축률~요인, 데이터집합명), p-value가 0.9423으로 등분산성 만족

# 일원분산분석(one-way ANOVA)
aov(shrinkage~tem_level, data = camfiber)
summary(aov(shrinkage~tem_level, data = camfiber)) 
"""
p-value가 유의수준보다 통계적으로 유의함 현저히 낮은 값으로 나오므로로 H1 온도에 따라 수축률의 차가 있다고 볼 수 있다. 
"""

