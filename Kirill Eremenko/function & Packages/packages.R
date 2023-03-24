# How to install packages
install.packages("ggplot2")

# How to activate the package

library(ggplot2)

?qplot()
?ggplot()
?diamonds

qplot(data = diamonds, carat, price, colour =clarity, facets = .~clarity)
