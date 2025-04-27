# load datset 
data(cars)

# scatter plot
plot(x = cars$speed, y = cars$dist,
     main="Effect of car speed on stopping distances", xlab="Speed (mph)", ylab="Stopping Distance (ft)") # labelling title, x and y axis

m <- lm(dist~speed, data = cars) # overlaying a line of best fit
abline(m, col = "red", lwd=2)

mod <- loess(dist~speed, data=cars, span=0.5, degree = 1) #LOESS regression model 
pred <- predict(mod, se=T)
lines(cars$speed, pred$fit, col="blue2", lwd=3) # overlaying predicted LOESS model values
lines(cars$speed, pred$fit + qt(0.975, pred$df) * pred$se.fit, col="blue2", lty=2) #overlaying predicted 95% C.I
lines(cars$speed, pred$fit - qt(0.975, pred$df) * pred$se.fit, col="blue2", lty=2) #overlaying predicted 95% C.I