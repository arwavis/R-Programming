

#Salary
#Games
#MinutesPlayed

# How to create your own matrix()
?matrix

my.data <- 1:20

A <- matrix(data=my.data, 4, 5)
A
A[2,3]

B <- matrix(data=my.data, 4, 5, byrow = T)
B
B[2,5]


# How to use rbind()
r1 <- c("I","am","happy")
r2 <- c("What","a","day")
r3 <- c(1,2,3)

C <- rbind(r1, r2, r3)
C

# How to use rbind()

D <- cbind(r1, r2, r3)
D

c1 <- 1:5
c2 <- -1:-5
E <- cbind(c1, c2)
E


# Named Vectors

Charlie <- 1:5
Charlie

# give Names
names(Charlie) <- c("a", "b", "c", "d" ,"e")
Charlie
Charlie["d"]

# Clear Names
names(Charlie) <- NULL
Charlie

#--------------------------

# Naming Matrix Dimensions

temp.vec <- rep(c("a", "B", "zZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec ,3 ,3)
Bravo


rownames(Bravo) <- c("How","are","you?")
Bravo

colnames(Bravo) <- c("I", "am", "fine")
Bravo

# Assign a different value in the Matrix.
Bravo["are","am"]<- 0
Bravo

# If you want to get rid of RowNames
rownames(Bravo) <- NULL
Bravo
