rm(list = ls())
nsim <- 1e4
x1 <- numeric(nsim)
x2 <- numeric(nsim)

x1[1] <- 0.01; x2[1] <- 0.01 # initial value
for (i in 2:nsim){
  x1[i] <- 2 * rexp(1, x2[i-1] + 1) 
  x2[i] <- 2 * rexp(1, x1[i] + 1)
}

x1 <- x1[2001:3000] # 1000개만 추출
x2 <- x2[2001:3000] # 1000개만 추출

par(mfrow = c(1,2))
ts.plot(x1, col = 3, xlab = "iter"); ts.plot(x2, col = 3, xlab = "iter") # 수렴 확인용

library(MASS)
library(ggplot2)
ggplot() + geom_point(aes(x1, x2)) # 산점도
ggplot() + geom_density2d(aes(x1, x2)) # 컨투어 그래프