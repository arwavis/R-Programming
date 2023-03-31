
x <- c("a", "b", "c", "d", "e")
x[c(1,5)]
x[1]


# To get the stats of top three players for last 5 years
Games[1:3,6:10]

# To compare the top player and the least player
Games[c(1,10),]

# We can also use names to get the output
Games[,c("2008","2009")]

Games[1,]
is.matrix(Games[1,])
is.vector(Games[1,])
# In the above code the output is extracted as vector and not matrix.
#If you need to get the output as matrix then,
Games[1,,drop=F]
Games[1,5 ,drop=F]
is.matrix(Games[1,,drop=F])
is.vector(Games[1,,drop=F])

# Visualizing Subset
#Data <-MinutesPlayed[1:3,]
Data <-MinutesPlayed[1,,drop=F]
matplot(t(Data), type = "b", pch =15:18, col =c(1:4,6))
legend("bottomleft",inset =0.01, legend=Players[1],col =c(1:4,6),pch =15:18, horiz = F)


