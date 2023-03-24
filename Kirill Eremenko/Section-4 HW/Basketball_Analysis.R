Games
rownames(Games)
colnames(Games)
Games["LeBronJames","2012"]

FieldGoals

round(FieldGoals / Games,1)

round(MinutesPlayed / Games)


?matplot
matplot(t(round(FieldGoals/Games,1)), type = "b", pch =15:18, col =c(1:4,6))
legend("bottomleft",inset =0.01, legend=Players,col =c(1:4,6),pch =15:18, horiz = F)

#How to transporse the data
#t(FieldGoals)


matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch =15:18, col =c(1:4,6))
legend("bottomleft",inset =0.01, legend=Players,col =c(1:4,6),pch =15:18, horiz = F)
