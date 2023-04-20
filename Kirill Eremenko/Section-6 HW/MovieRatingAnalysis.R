getwd()
setwd("/Users/aravindv/Documents/Programming/GitHub/R-Programming/Kirill Eremenko/Section-6 HW")
getwd()
moviestats <- read.csv("P2-Movie-Ratings.csv")
head(moviestats)
colnames(moviestats) <-c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(moviestats)
tail(moviestats)
str(moviestats)
summary(moviestats)

#---------------------------- Factors
# Year is represented as Int but we want to convert this to factor as we are not doing calcuation with Year.
# how to convert int to factor

factor(moviestats$Year)
moviestats$Year <-factor(moviestats$Year)

str(moviestats)
summary(moviestats)

#---------------------------- Aesthetics
library(ggplot2)

ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating))

#---------------------------- Add Geomentary
ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating)) + geom_point()


#---------------------------- Add Colour
ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating, 
                            colour = Genre)) + geom_point()

#---------------------------- Add Size
ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating, 
                            colour = Genre, size = Genre)) + geom_point()
  
#---------------------------- Add Size with a better way
ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating, 
                            colour = Genre, size = BudgetMillions)) + geom_point()  

# This is #1 (We will improve it)

#---------------------------- Platting with Layers
p <- ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating, 
                                 colour = Genre, size = BudgetMillions))
#points
p + geom_point() 

#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#---------------------------- Overriding Aesthetics

q <- ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating, 
                                 colour = Genre, size = BudgetMillions))
  
# add geom layer

q + geom_point()

# Overriding aesthtcis
#example 1
q+ geom_point(aes(size=CriticRating))

#example 2
q + geom_point(aes(colour=BudgetMillions))

#q remains same
q + geom_point()

#example 3
q + geom_point(aes(x=BudgetMillions)) + 
  xlab("Budget Millions $$$")

q +geom_line() + geom_point()
#reduce line size
q + geom_line(size=1) + geom_point()


#---------------------------- Mapping Vs Setting
r <- ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add Colour
# 1 Mapping (What we have done so far):

r + geom_point(aes(colour=Genre))
#2 Setting:
r + geom_point(colour= "DarkGreen")

# Error if you use the color in aes as it will not work
#r + geom_point(aes(colour="DarkGreen"))

#1.Mapping

r + geom_point(aes(size=BudgetMillions))
r + geom_point(size =10)
#Error:f you use the size in aes as it will not work
r + geom_point(aes(size=10))

#---------------------------- Histograms and Density charts
s <- ggplot(data=moviestats, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

# add Colour
s + geom_histogram(binwidth = 10, aes(fill=Genre))

# Add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

# We will improve it

# Density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position = "stack")

#---------------------------- Starting layer Tips.

t <- ggplot(data=moviestats, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill = "White", colour="Blue")
# Another way to get this plot

t <-  ggplot(data=moviestats, aes(x= ))
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill = "White", colour="Blue")

t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill = "White", colour="Blue")

# This is also a valid approach if you want to start with a empty plot
t <-  ggplot()
t + geom_histogram(binwidth = 10,
                   data=moviestats,
               aes(x=AudienceRating),
               fill = "White", colour="Blue")



#---------------------------- Statistical Transformations.

?geom_smooth
u <- ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating,
                                 colour =Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=moviestats, aes(x=Genre, y =AudienceRating,
                                 colour =Genre))
u + geom_boxplot(size =1.2)
u + geom_boxplot(size =1.2) + geom_point()
#tip / hack:
u + geom_boxplot(size =1.2) + geom_jitter()
#another way:

u + geom_jitter() + geom_boxplot(size =1.2, alpha=0.5)


#---------------------------- Using Facets

v <- ggplot(data=moviestats, aes(x=BudgetMillions))
v +geom_histogram(binwidth = 10, aes(fill=Genre),
                  colour="Black")

# facets:

v +geom_histogram(binwidth = 10, aes(fill=Genre),
                  colour="Black") + 
  facet_grid(Genre~., scales ="free")

# Apply facets to ScatterPlots

w <- ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating,
                                 colour =Genre))
w + geom_point(size =3) +
  facet_grid(Genre~.)

w + geom_point(size =3) +
  facet_grid(.~Year)

w + geom_point(size =3) +
  facet_grid(Genre~Year)

w + geom_point(aes(size= BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

# Will still improve


#---------------------------- Co-ordinates

#limits
#zoom

m <- ggplot(data=moviestats, aes(x=CriticRating, y=AudienceRating,
                                 colour =Genre))
m + geom_point()

m + geom_point() + 
  xlim(50,100) +
  ylim(50,100)

# wont work well always
 
n <- ggplot(data=moviestats, aes(x= BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour = "Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), colour = "Black") +
  ylim(0,50)

# instead - zoom
n + geom_histogram(binwidth = 10, aes(fill=Genre), colour = "Black") +
  coord_cartesian(ylim=c(0,50))


# improve #1

w + geom_point(aes(size= BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

#---------------------------- Theme

o <- ggplot(data=moviestats, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
h
#axes label

h + xlab("Money Axis") +
  ylab("Number of Movies")

# Label Formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=30),
        axis.title.y = element_text(colour = "Red",size=30))

# Formatting tick marks
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=30),
        axis.title.y = element_text(colour = "Red",size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20)) 

# Formatting legend
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=30),
        axis.title.y = element_text(colour = "Red",size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

# Formatting title of the plot
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour = "DarkGreen", size=30),
        axis.title.y = element_text(colour = "Red",size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour = "DarkBlue",size=40, family = "Courier"))













