library(NMF)
#library(here)
#library(InterSIM)
#library(IntNMF)
#library(caret)
library(ggplot2)

# DON'T FORGET TO SET WORKING DIRECTORY TO FILE SOURCE: Session -> Set Working Directory -> To Source File Location

fg_kde <- read.csv(file='../../data/fg_kde.csv', header=FALSE)

#randomize data
v.random <- randomize(fg_kde)

k.start <- 1
k.end <- 6
k.nrun <- 30
k.seed <- 42
k.model <- 'Frobenius'

estim.name <- paste('measures', '_', k.model, '_', k.start, '-', k.end, '_run', k.nrun, '_', k.seed, '.csv', sep='')
estim.random.name <- paste('measures', '_', k.model, '_', k.start, '-', k.end, '_run', k.nrun, '_', k.seed, '_random.csv', sep='')

#single method, finding k
estim.r <- nmf(fg_kde, k.start:k.end, nrun=k.nrun, k.model, seed=k.seed)
estim.r.random <- nmf(v.random, k.start:k.end, nrun=k.nrun, k.model, seed=k.seed)

#plot
plot(estim.r)
plot(estim.r, estim.r.random)

#save measures as CSV
write.csv(estim.r[["measures"]], paste('../../data/nmf/measures/', estim.name, sep=''))
write.csv(estim.r.random[["measures"]],  paste('../../data/nmf/measures/', estim.random.name, sep=''))

#opt.k <- nmf.opt.k(dat=fg_kde, n.runs=5, n.fold=10, k.range=1:10, result=TRUE, make.plot=TRUE, progress=TRUE)

#compare methods, finding k
res.multi.method <- nmf(fg_kde, 3:5, list('KL', 'Frobenius'), nrun=5, seed=42, .options='t')
compare(res.multi.method)

plot(res.multi.method[['KL']], res.multi.method[['Frobenius']])
