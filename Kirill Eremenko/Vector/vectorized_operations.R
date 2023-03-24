

x <- rnorm(5)
x

# R- Specific programming loop
for (i in x){
  print(i)
}

print (x[1])

# conventional programming loop.
for (j in 1:5){
  print(x[j])
}


# --------------------------- 2nd Part

N <- 100
a <- rnorm(N)
b <- rnorm(N)

# Vectorized approach

c <- a * b

# De-vectorized Approach

d <- rep(NA,N)
for(i in 1:N){
  d[i] <- a[i] * b[i]

}