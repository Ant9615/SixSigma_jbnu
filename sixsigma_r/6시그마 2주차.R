library(nortest) # 앤더슨-달링 테스트를 위한 라이브러리

# 데이터 입력
ODO <- c(19.2,19.9,20.6,16.9,20.4,18.7,18.8,20.2,19.3,19.0,18.5,17.9,18.6,19.0,18.4,17.3,17.8,18.2,18.3,17.0)
str(ODO) # 데이터 구조확인 

# 기술통계량
"""
요약통계량(최소값, 1분위수, 중앙값, 평균, 3분위수, 최댓값)
 Min.   1st Qu.  Median   Mean   3rd Qu.  Max. 
16.90   18.12   18.65   18.70   19.23   20.60
  
분산(Variance)
1.109474

표준편차(Standard Deviation)
1.053316

범위(Range)
3.7
"""
summary(ODO) # 요약통계량(최소값, 최댓값, 사분위수, 중앙값, 평균) 
sd(ODO) # 표준편차
var(ODO) # 분산 
ODO_range <- max(ODO)-min(ODO) # 범위
ODO_range

qqnorm(ODO) # 데이터 분산도 
qqline(ODO) # 데이터 분산도에 라인 추가

# 앤더슨-달링 테스트
ad.test(ODO) # p-value가 0.8618로 정규성을 갖는다.
