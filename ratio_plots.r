df <- read.csv('normal.dat', sep='\t')

f <- df$X.f
g <- df$g
fg <- df$f.g.1
fg <- sapply(fg, function(y) min(max(y, -5.),5.))
fg <- fg[! fg %in% c(-5,5)]


png("normal_ratio.png", width=750, height=600)
hist(fg, breaks=100, freq=F, angle=45, col="blue", density=5, main="Ratio of Normal Distributions", xlab="bin center value")
hist(f, breaks=100, freq=F, angle=45, col="green", density=20, add=T)
hist(g, breaks=200, freq=F, angle=-45, col="orange", density=20, add=T)
# x0 and gamma from gnuplot curve fit of cauchy distr PDF to hist mids and density
curve(dcauchy(x, location=-0.000786135, scale= 0.305159), add=T, col="red", lwd=1)
dev.off()
