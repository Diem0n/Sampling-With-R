library(RColorBrewer)
library(mvtnorm)
library(plotrix)

# define a matrix G and find its inverse
G <- matrix(c(5.1,0.3,1,0.3,5.1,1,1,1,0),3,3)
solve(G)

# define a vector h and compute G^-1 * h
h <- c(3.1,0.4,0.1)
solve(G) %*% h

# define two vectors y and a, and compute a[1:2] %*% y
y <- c(5.526,1.417)
a <- solve(G) %*% h
a[1:2] %*% y

# simulate a spatial log Gaussian process
nside <- 50
N <- nside * nside
coord1 <- rep(1:nside , times=nside)
coord2 <- rep(1:nside , each=nside)

# plot the coordinates on a grid and compute their distances
distances <- dist(cbind(coord1,coord2))
distance <- as.matrix(distances)

# compute the covariance and mean of the process
covpop <- exp(-(distance/1)^2)
meanpop <- rep(0,N)

# generate one realization of the process and plot it
y <- rmvnorm(1,meanpop , covpop)
z <- matrix(y,nside,nside)
w <- exp(z)

# create a custom color palette
cols <- colorRampPalette(c("green3", "yellow", "red"))(10)

# plot the contour
contour(1:nside,1:nside,w, col=cols, lwd=2, levels=seq(0, max(w), length.out=10), 
        xlab="X", ylab="Y", main="Spatial Log Gaussian Process SIngle Realization")

# generate many realizations of the process and plot them
y <- rmvnorm(1,meanpop , covpop)
w <- matrix(exp(y) , nside,nside)

# plot the contour
contour(1:nside,1:nside,w, col=cols, lwd=2, levels=seq(0, max(w), length.out=10), 
        xlab="X", ylab="Y", main="Spatial Log Gaussian Process Multiple Realizations ")

