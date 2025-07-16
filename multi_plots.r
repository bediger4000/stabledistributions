df <- read.csv('multi.dat', sep='\t')

s <- df$sum

png("multi_uniform.png", width=750, height=600)
hist(s, breaks=100, freq=F, main="Density of uniform distribution sum", xlab="bin center value")
curve(dnorm(x, 7.038, 1.980), add=T, col="red", lwd=2)
dev.off()
