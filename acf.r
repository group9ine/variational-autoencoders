acf <- function(data, h) {
 mean(data[(h+1):length(data[,1]),]*data[1:(length(data[,1])-h),])
}

get_correls <- function(data, step=100, stop=NA) {
    correls <- c()
    if(is.na(stop)){
        stop <- (length(data[,1])%/%step -1)
    }
    for(i in 0:stop) {
        a <- acf(data, i*step)
        correls <- c(correls,a)
    #     print(c(i*100, a))
    }
    correls
}
