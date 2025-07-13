df <- read.csv('cauchy.dat', sep='\t')

a <- df$X.a
b <- df$b
ab <- df$a.b

png("cauchy_histo.png", width=750, height=600)
hist(a, breaks=75, freq=F, main="Uncombined Cauchy Distributions and Probability Distribution Functions", xlab="bin center value", angle=45, col="green", density=20)
hist(b, breaks=75, freq=F, angle=-45, col="orange", density=20, add=T)
curve(dcauchy(x, location=0.0, scale= 1.0), add=T, col="red", lwd=1)
curve(dcauchy(x, location=5.0, scale= 2.0), add=T, col="blue", lwd=1)
dev.off()

png("cauchy_combo.png", width=750, height=600)
hist(a, breaks=75, freq=F, main="Combined Cauchy Distributions", xlab="bin center value", angle=45, col="green", density=20)
hist(b, breaks=75, freq=F, angle=-45, col="orange", density=20, add=T)
hist(ab, breaks=100, freq=F, angle=30, col="blue", density=20, add=T)
dev.off()

png("cauchy_combo_pdf.png", width=750, height=600)
hist(ab, breaks=100, freq=F, main="Combined Cauchy Distribution and Probability Density curve fit", xlab="bin center value", angle=30, col="blue", density=20)
curve(dcauchy(x, location=4.8, scale= 2.9), add=T, col="red", lwd=1)
dev.off()

q()
