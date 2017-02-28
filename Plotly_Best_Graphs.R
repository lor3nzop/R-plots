##########
# PLOTLY #
##########

install.packages("plotly")

library(plotly)


#### HEATMAP ####

# Data matrix
m <- matrix(rnorm(9), nrow = 3, ncol = 3)

# Categorical Axes
plot_ly(x = c("a", "b", "c"), y = c("d", "e", "f"), z = m, type = "heatmap")

# Sequential Colorscales: Greys
plot_ly(z = volcano, colorscale = "Greys", type = "heatmap")

# Custom colorscales
plot_ly(z = volcano, colors = colorRamp(c("red", "green")), type = "heatmap")

# Scaling yourself and use the colorscale attribute directly
vals <- unique(scales::rescale(c(volcano)))
o <- order(vals, decreasing = FALSE)
cols <- scales::col_numeric("Blues", domain = NULL)(vals)
colz <- setNames(data.frame(vals[o], cols[o]), NULL)
plot_ly(z = volcano, colorscale = colz, type = "heatmap")


#### BUBBLE CHART ####

data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv")

# Simple bubble chart
plot_ly(data, x = ~Women, y = ~Men, text = ~School, type = 'scatter', mode = 'markers',
        marker = list(size = ~gap, opacity = 0.5)) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE))

# Setting Markers Color
plot_ly(data, x = ~Women, y = ~Men, text = ~School, type = 'scatter', mode = 'markers',
        marker = list(size = ~gap, opacity = 0.5, color = 'rgb(255, 65, 54)')) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE))

# Setting Multiple Colors
colors <- c('rgba(204,204,204,1)', 'rgba(222,45,38,0.8)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)',
            'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)',
            'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)',
            'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)', 'rgba(204,204,204,1)',
            'rgba(204,204,204,1)')
# Note: The colors will be assigned to each observations based on the order of the observations in the dataframe.

plot_ly(data, x = ~Women, y = ~Men, text = ~School, type = 'scatter', mode = 'markers',
        marker = list(size = ~gap, opacity = 0.5, color = colors)) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE))

# Mapping a Color Variable (Continuous)
plot_ly(data, x = ~Women, y = ~Men, text = ~School, type = 'scatter', mode = 'markers', color = ~gap, colors = 'Reds',
        marker = list(size = ~gap, opacity = 0.5)) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE))

# Mapping a Color Variable (Categorical)
data$State <- as.factor(c('Massachusetts', 'California', 'Massachusetts', 'Pennsylvania', 'New Jersey', 'Illinois', 'Washington DC',
                          'Massachusetts', 'Connecticut', 'New York', 'North Carolina', 'New Hampshire', 'New York', 'Indiana',
                          'New York', 'Michigan', 'Rhode Island', 'California', 'Georgia', 'California', 'California'))

plot_ly(data, x = ~Women, y = ~Men, text = ~School, type = 'scatter', mode = 'markers', size = ~gap, color = ~State, colors = 'Paired',
        marker = list(opacity = 0.5, sizemode = 'diameter')) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE),
         showlegend = FALSE)

# Scaling the Size of Bubble Charts
data$State <- as.factor(c('Massachusetts', 'California', 'Massachusetts', 'Pennsylvania', 'New Jersey', 'Illinois', 'Washington DC',
                          'Massachusetts', 'Connecticut', 'New York', 'North Carolina', 'New Hampshire', 'New York', 'Indiana',
                          'New York', 'Michigan', 'Rhode Island', 'California', 'Georgia', 'California', 'California'))

plot_ly(data, x = ~Women, y = ~Men, text = ~School, type = 'scatter', mode = 'markers', size = ~gap, color = ~State, colors = 'Paired',
             #Choosing the range of the bubbles' sizes:
             sizes = c(10, 50),
             marker = list(opacity = 0.5, sizemode = 'diameter')) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE),
         showlegend = FALSE)

# Hover Text with Bubble Charts
data$State <- as.factor(c('Massachusetts', 'California', 'Massachusetts', 'Pennsylvania', 'New Jersey', 'Illinois', 'Washington DC',
                          'Massachusetts', 'Connecticut', 'New York', 'North Carolina', 'New Hampshire', 'New York', 'Indiana',
                          'New York', 'Michigan', 'Rhode Island', 'California', 'Georgia', 'California', 'California'))

plot_ly(data, x = ~Women, y = ~Men, type = 'scatter', mode = 'markers', size = ~gap, color = ~State, colors = 'Paired',
             sizes = c(10, 50),
             marker = list(opacity = 0.5, sizemode = 'diameter'),
             hoverinfo = 'text',
             text = ~paste('School:', School, '<br>Gender gap:', gap)) %>%
  layout(title = 'Gender Gap in Earnings per University',
         xaxis = list(showgrid = FALSE),
         yaxis = list(showgrid = FALSE),
         showlegend = FALSE)

# Styled Buble Chart
data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv")

data_2007 <- data[which(data$year == 2007),]
data_2007 <- data_2007[order(data_2007$continent, data_2007$country),]
slope <- 2.666051223553066e-05
data_2007$size <- sqrt(data_2007$pop * slope)
colors <- c('#4AC6B7', '#1972A4', '#965F8A', '#FF7070', '#C61951')

plot_ly(data_2007, x = ~gdpPercap, y = ~lifeExp, color = ~continent, size = ~size, colors = colors, 
             type = 'scatter', mode = 'markers', sizes = c(min(data_2007$size), max(data_2007$size)),
             marker = list(symbol = 'circle', sizemode = 'diameter',
                           line = list(width = 2, color = '#FFFFFF')),
             text = ~paste('Country:', country, '<br>Life Expectancy:', lifeExp, '<br>GDP:', gdpPercap,
                           '<br>Pop.:', pop)) %>%
  layout(title = 'Life Expectancy v. Per Capita GDP, 2007',
         xaxis = list(title = 'GDP per capita (2000 dollars)',
                      gridcolor = 'rgb(255, 255, 255)',
                      range = c(2.003297660701705, 5.191505530708712),
                      type = 'log',
                      zerolinewidth = 1,
                      ticklen = 5,
                      gridwidth = 2),
         yaxis = list(title = 'Life Expectancy (years)',
                      gridcolor = 'rgb(255, 255, 255)',
                      range = c(36.12621671352166, 91.72921793264332),
                      zerolinewidth = 1,
                      ticklen = 5,
                      gridwith = 2),
         paper_bgcolor = 'rgb(243, 243, 243)',
         plot_bgcolor = 'rgb(243, 243, 243)')

#### GGPLOTLY ####
set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]

p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Clarity:", clarity))) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

ggplotly(p)

#### BOXPLOT ####

# Basic plot
plot_ly(y = ~rnorm(50), type = "box") %>% add_trace(y = ~rnorm(50, 1))

# Adding Jittered Points
plot_ly(y = ~rnorm(50), type = "box", boxpoints = "all", jitter = 0.3, pointpos = -1.8)

# Several Box Plots
plot_ly(ggplot2::diamonds, y = ~price, color = ~cut, type = "box")

# Grouped Box Plots
plot_ly(ggplot2::diamonds, x = ~cut, y = ~price, color = ~clarity, type = "box") %>%
  layout(boxmode = "group")

# 

