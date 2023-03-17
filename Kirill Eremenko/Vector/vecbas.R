

MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L, 12L, 243L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a", "B23", "Hello", 7)
# if you add an integer in a character vector the integer 
#will be identified as character automatically

is.numeric(V3)
is.integer(V3)
is.double(V3)
is.character(V3)
is.array(V3)

# Other ways of creating Vector
seq() # sequence - like ":"
rep() #replicate

seq(1,15) # same as
1:15
# Sequence gives you the flexibility to add step like
seq(1,15,2)
z <- seq(1,15,4) 
z

rep(3, 50)
# Replicates the number 3 50 times.
d <- rep(3, 50)

# You can also replicate characters

rep ("a", 5)

x <- c(80,20)
rep(x, 10)

# How to access the values in a vector using the index.
w <- c("a", "b", "c", "d", "e")
w
w[1]
w[2]
w[1:3]
w[-1]
v <- w[-3]
w[-1:-3]
w[c(1,3,5)]
w[c(-1,-4)]
w[1:2]
