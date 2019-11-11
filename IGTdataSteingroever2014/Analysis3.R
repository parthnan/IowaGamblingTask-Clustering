index_100 <- read.csv("index_100.csv")
choice_100 <- read.csv("choice_100.csv")
wi_100 <- read.csv("wi_100.csv")
lo_100 <- read.csv("lo_100.csv")


# 研究事例（論文の第一著者名）の抽出（100試行のデータ）
author <- unique(index_100[,2])

# 第一番目の研究事例（Horstmann）のデータ抽出
studyName <- author[1]
subIndex <- as.numeric(index_100[index_100[,2]==studyName,1])
choice_data <- choice_100[subIndex,]
win_data <- wi_100[subIndex,]
lose_data <- lo_100[subIndex,]

# 第一番目の実験参加者の結果

as.vector(win_data["Subj_1",])+as.vector(lose_data["Subj_1",])

subID=1
valscale <- 0.01 #得失・損失の額のスケーリング

# 価値判断：パラメータw
valence <- function(w){
  return(as.numeric(valscale*w*win_data[subID,])+as.numeric(valscale*(1-w)*lose_data[subID,]))
}

# 期待価値の更新：パラメータa
expected_valence <- function(a,t,val,expval){
  return(expval[t-1]+a*(val[t]-expval[t-1]))
}

# 全てのカードの山の期待価値の更新
expected_valence_all <- function(w,a){
  EE <-NULL
  for (j in 1:4) {
    E <- NULL
    for (t in 1:100) {
      # 1回目の更新
      if (t==1) {
        if (choice_data[subID,1]==j) {
          E <-valence(w)[1]
        }else{
          E <- 0
        }
      }else{
        # 2回目以降の更新
        if (choice_data[subID,t]==j) {
          EV <- expected_valence(a,t,valence(w),E)
          E <- c(E,EV)
        }else{
          E <- c(E,E[t-1])
        }
      }
    }
    EE <- c(EE,list(E))
  }
  return(EE)
}

# 選択の一貫性：パラメータc
theta <- function(c){
  return(((1:100)/10)^c)
}

# カードの山の選択確率
select_deck <- function(w,a,c){
  EA <-expected_valence_all(w,a)
  P1 <- exp(theta(c)*EA[[1]])
  P2 <- exp(theta(c)*EA[[2]])
  P3 <- exp(theta(c)*EA[[3]])
  P4 <- exp(theta(c)*EA[[4]])
  
  PP <- P1+P2+P3+P4
  
  PP1 <- P1/PP
  PP2 <- P2/PP
  PP3 <- P3/PP
  PP4 <- P4/PP
  
  return(list(PP1,PP2,PP3,PP4))
}

# 全選択の対数尤度
LL <- function(pp){
  D <- select_deck(pp[1],pp[2],pp[3])
  S <- 0
  for (t in 1:100) {
    for (j in 1:4) {
      if (choice_data[subID,t]==j) {
        S <-log(D[[j]][t])+S
      }
    }
  }
  return(-S)
}

system.time(
result <- optim(par=c(0.5,0.5,0.01),fn=LL,method = "L-BFGS-B",lower = c(0,0,-2),upper = c(1,1,2) )
)

"L-BFGS-B" で探索範囲指定
