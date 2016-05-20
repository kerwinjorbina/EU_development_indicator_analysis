# Shading between two lines - ggplot
# ========================================================
#   
#   First one to say geom_ribbon loses. I was plotting some data for a colleague, 
# had two lines (repeated experiment) per person (time on the x axis) facetted by id,
# I thought it'd be nice to shade the area between the two lines so that when they were
# deviating you'd see a large shaded area, and when they were close there would be little 
# shading, just to aid the visual of the separation between repeats. I thought this would
# be trival, and geom_ribbon would do the trick, alas, some of the lines crossed so that 
# didn't pan out. Ignoring the 'experiment/order' variable and reordering the data to
# track the max and min values at each time point doesn't work, because when they 
# cross you end up with a box around the cross, rather the inside region being shaded.
# 
# <!-- more -->
#   
#   I did think this would have been done before, but I couldn't find anything that 
# resuable. There was [this blog post](
# http://learnr.wordpress.com/2009/10/22/ggplot2-two-color-xy-area-combo-chart/)
# but like user Aniko mentioned in the comments, that was essentially finding the 
# midpoints by hand, which seemed a bit clumsy (not saying the below is any better).
# Aniko's solution used a package [gpclib](http://cran.r-project.org/web/packages/gpclib/index.html)
# to create polygons for each block of colour, which was about where I got to when looking for a
# ggplot strategy. I played around a bit and couldn't get the gpc.poly data to work with ggplot, 
# so put together a couple of small functions to essentially do the same thing. 
# 
# So here's the code and output. 

# load data
library(ggplot2)
library(RCurl)
library(gridExtra)
library(plyr)
theme_set(theme_bw())

#######################################################################


head(PLOT_NICE)
head(dat)

mperson <- function(x){
  x <- x[order(x$Year),]
  y <- x[-c(1,2,nrow(x)-1,nrow(x)), ]
  x <- rbind(x,y)
  x <- x[order(x$Year),]
  x$group <- rep(letters[1:(nrow(x)/4)], each=4)
  return(x)
}
dat2 <- ddply(PLOT_NICE, .(id), mperson)
head(dat2)

dat3<- ddply(PLOTG_NICE, .(id), mperson)
dat4<- ddply(PLOTH_NICE, .(id), mperson)
# this block is run within each person and 'block (group)' of 4 rows (each polygon)
# essentially this is to get the rows in the correct order, so that the geom_polygon function
# can work clockwise to construct the polygons the correct way
mgroup <- function(x){
  x <- x[order(x$Value), ]
  left <- x[x$Year == min(x$Year), ]
  right <- x[x$Year == max(x$Year), ]
  if(all(left$order == right$order)){
    left <- left[order(left$Value, decreasing = T), ]
    right <- right[order(right$Value, decreasing = F), ]
    return(rbind(left, right))
  } else {
    return(x[order(x$Year), ])
  } 
}
dat2 <- ddply(dat2, .(id,group), mgroup)
head(dat2)
dat3 <- ddply(dat3, .(id,group), mgroup)
dat4 <- ddply(dat4, .(id,group), mgroup)

## And here's the plot
require(mgcv)
# TRADE
ggplot(PLOT_NICE, aes(x=Year, y=Value, group=order)) + 
  geom_line(aes(colour=factor(order))) +
  geom_point(aes(colour=factor(order))) + 
  geom_polygon(data=dat2, aes(y=Value, group=group), alpha=0.3, fill="green") +
  facet_wrap( ~ id) 

#GDP

ggplot(PLOTG_NICE, aes(x=Year, y=Value, group=order)) + 
  geom_line(aes(colour=factor(order))) +
  geom_point(aes(colour=factor(order))) +
  geom_polygon(data=dat3, aes(y=Value, group=group), alpha=0.3, fill="green") +
  facet_wrap( ~ id)
plot

#Health Expenditure

ggplot(PLOTH_NICE, aes(x=Year, y=Value, group=order)) + 
  geom_line(aes(colour=factor(order))) +
  geom_point(aes(colour=factor(order))) + 
  geom_polygon(data=dat4, aes(y=Value, group=group), alpha=0.3, fill="green") +
  facet_wrap( ~ id) 
