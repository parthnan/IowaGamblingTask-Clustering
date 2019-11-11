# 研究事例（論文の第一著者名）の抽出（100試行のデータ）
author <- unique(index_100[,2])

# 第一番目の研究事例（Horstmann）のデータ抽出
studyName <- author[1]
subIndex <- as.numeric(index_100[index_100[,2]==studyName,1])
choice_data <- choice_100[subIndex,]
win_data <- wi_100[subIndex,]
lose_data <- lo_100[subIndex,]
reward_data <- win_data+lose_data
cumReward <- t(apply(reward_data,1,cumsum))

# 第一番目の実験参加者の結果
## 累積報酬
cdata <- cumReward[1,]
if(cdata[100]<0){
  gcol="Red"
}else{
  gcol="Black"
}
plot(cdata,type="l",col=gcol,ylim=c(-3000,3000),xlab="Trials",ylab="Cumulative reward")

# 全ての実験参加者の結果
## 累積報酬
par(mfrow=c(4,4))
for(i in 49:64){
  cdata <- cumReward[i,]
  if(cdata[100]<0){
    gcol="Red"
  }else{
    gcol="Black"
  }
  plot(cdata,type="l",col=gcol,ylim=c(-3000,3000),xlab="Trials",ylab="Cumulative reward")
}
