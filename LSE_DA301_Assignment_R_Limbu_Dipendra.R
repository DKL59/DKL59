## LSE Data Analytics Online Career Accelerator 
# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment 5 scenario
## Turtle Games’s sales department has historically preferred to use R when performing 
## sales analyses due to existing workflow systems. As you’re able to perform data analysis 
## in R, you will perform exploratory data analysis and present your findings by utilising 
## basic statistics and plots. You'll explore and prepare the data set to analyse sales per 
## product. The sales department is hoping to use the findings of this exploratory analysis 
## to inform changes and improvements in the team. (Note that you will use basic summary 
## statistics in Module 5 and will continue to go into more detail with descriptive 
## statistics in Module 6.)

################################################################################

## Assignment 5 objective
## Load and wrangle the data. Use summary statistics and groupings if required to sense-check
## and gain insights into the data. Make sure to use different visualisations such as scatterplots, 
## histograms, and boxplots to learn more about the data set. Explore the data and comment on the 
## insights gained from your exploratory data analysis. For example, outliers, missing values, 
## and distribution of data. Also make sure to comment on initial patterns and distributions or 
## behaviour that may be of interest to the business.

################################################################################

# Module 5 assignment: Load, clean and wrangle data using R

## It is strongly advised that you use the cleaned version of the data set that you created and 
##  saved in the Python section of the course. Should you choose to redo the data cleaning in R, 
##  make sure to apply the same transformations as you will have to potentially compare the results.
##  (Note: Manual steps included dropping and renaming the columns as per the instructions in module 1.
##  Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 

## 1. Open your RStudio and start setting up your R environment. 
## 2. Open a new R script and import the turtle_review.csv data file, which you can download from 
##      Assignment: Predicting future outcomes. (Note: You can use the clean version of the data 
##      you saved as csv in module 1, or, can manually drop and rename the columns as per the instructions 
##      in module 1. Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 
## 3. Import all the required libraries for the analysis and view the data. 
## 4. Load and explore the data.
##    - View the head the data.
##    - Create a summary of the new data frame.
## 5. Perform exploratory data analysis by creating tables and visualisations to better understand 
##      groupings and different perspectives into customer behaviour and specifically how loyalty 
##      points are accumulated. Example questions could include:
##    - Can you comment on distributions, patterns or outliers based on the visual exploration of the data?
##    - Are there any insights based on the basic observations that may require further investigation?
##    - Are there any groupings that may be useful in gaining deeper insights into customer behaviour?
##    - Are there any specific patterns that you want to investigate
## 6. Create
##    - Create scatterplots, histograms, and boxplots to visually explore the loyalty_points data.
##    - Select appropriate visualisations to communicate relevant findings and insights to the business.
## 7. Note your observations and recommendations to the technical and business users.

###############################################################################

# Your code here.

# 1. Check your working directory
getwd()

# 2. Install necessary packages if you don't have them
install.packages(c("dplyr", "ggplot2", "readr", "summarytools", "multiverse"))

# 3. Load the libraries
library(dplyr)
library(ggplot2)
library(readr)
library(summarytools)
library(multiverse)

# 4. Importing the data file
tr <- read.csv("turtle_reviews.csv", header = TRUE, sep = ",")

# View the first few rows of the dataset
head(tr)
colnames(tr)

# 5. Drop 'language' and 'platform' columns and rename columns `remuneration (kÂ£)`
# and `spending_score (1-100)`
tr_f <- tr %>%
  select(-platform, -language) %>%
  rename(
    remuneration = `remuneration..k..`, 
    spending_score = `spending_score..1.100.`
  )

# View the dataframe after changed column names
head(tr_f)

# Summary of the Data
summary(tr_f)

# Check the column names of the dataset
colnames(tr_f)


# 6. Exploratory data analysis

# Install package
install.packages("ggcorrplot")

# Load the library
library(ggcorrplot)

# Histogram for loyalty_points
ggplot(tr_f, aes(x = loyalty_points)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Loyalty Points", x = "Loyalty Points", y = "Frequency") 

# Boxplot for loyalty_points
ggplot(tr_f, aes(y = loyalty_points)) +
  geom_boxplot(fill = "green", color = "black") +
  labs(title = "Boxplot of Loyalty Points", y = "Loyalty Points") 

# Scatterplot of loyalty_points vs remuneration
ggplot(tr_f, aes(x = remuneration, y = loyalty_points)) + geom_point() + geom_smooth(method = "lm") +
  geom_point(color = "red") +
  labs(title = "Loyalty Points vs Remuneration", x = "Remuneration", y = "Loyalty Points")


# Correlation heatmap. Find correlation with loyalty_points.

cor_matrix <- cor(tr_f %>% select_if(is.numeric))
ggcorrplot(cor_matrix, lab = TRUE, title = "Correlation Heatmap")


# Load the necessary package
library(dplyr)

# Explore loyalty_point accumulation by Remuneration.
# Define remuneration ranges based on quantiles
tr_f$remuneration_range <- cut(tr_f$remuneration,
                               breaks = quantile(tr_f$remuneration, probs = 0:3 / 3, na.rm = TRUE),
                               labels = c("Low", "Medium", "High"),
                               include.lowest = TRUE)

# Group by remuneration range and calculate summary statistics for loyalty_points
library(dplyr)

summary_stats <- tr_f %>%
  group_by(remuneration_range) %>%
  summarise(
    mean_loyalty_points = mean(loyalty_points, na.rm = TRUE),
    median_loyalty_points = median(loyalty_points, na.rm = TRUE),
    min_loyalty_points = min(loyalty_points, na.rm = TRUE),
    max_loyalty_points = max(loyalty_points, na.rm = TRUE),
    sd_loyalty_points = sd(loyalty_points, na.rm = TRUE)
  )

# View the result.
print(summary_stats)

# Boxplot: Loyalty Points vs Remuneration Range

ggplot(tr_f, aes(x = remuneration_range, y = loyalty_points, fill = remuneration_range)) +
  geom_boxplot() +
  labs(title = "Loyalty Points Across Remuneration Ranges",
       x = "Remuneration Range",
       y = "Loyalty Points") +
  theme_minimal()

# Bar plot: Mean Loyalty Points by Remuneration Range
ggplot(summary_stats, aes(x = remuneration_range, y = mean_loyalty_points, fill = remuneration_range)) +
  geom_bar(stat = "identity") +
  labs(title = "Mean Loyalty Points by Remuneration Range",
       x = "Remuneration Range",
       y = "Mean Loyalty Points") +
  theme_minimal()

# Explain the result
# Mean Loyalty Points: The mean loyalty points increase significantly as remuneration increases:
# 1. Low earners: Mean loyalty points = 725
# 2. Medium earners: Mean loyalty points = 1551
# 3. High earners: Mean loyalty points = 2503

# This suggests that higher earners tend to accumulate more loyalty points on average.
# Median Loyalty Points:
  
# The median loyalty points show a similar trend:
# Low earners: Median loyalty points = 724
# Medium earners: Median loyalty points = 1463
# High earners: Median loyalty points = 2262
# This reinforces the observation that higher earners are accumulating more loyalty points, 
# and it seems to be consistent across both the mean and median values.

# Explore loyalty points accumulation by spending_score.
# Calculate the quantiles of spending_score
spending_quantiles <- quantile(tr_f$spending_score, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

# Define spending_score ranges based on quantiles
tr_f$spending_score_quantile <- cut(tr_f$spending_score,
                                    breaks = spending_quantiles,
                                    include.lowest = TRUE,
                                    labels = c("Low", "Medium-Low", "Medium-High", "High"),
                                    right = TRUE)

# View the quantile-based spending score groups
table(tr_f$spending_score_quantile)

# Summary statistics for loyalty_points by spending_score_quantile
summary_spending_loyalty <- tr_f %>%
  group_by(spending_score_quantile) %>%
  summarise(
    mean_loyalty_points = mean(loyalty_points, na.rm = TRUE),
    median_loyalty_points = median(loyalty_points, na.rm = TRUE),
    min_loyalty_points = min(loyalty_points, na.rm = TRUE),
    max_loyalty_points = max(loyalty_points, na.rm = TRUE),
    sd_loyalty_points = sd(loyalty_points, na.rm = TRUE)
  )

# View the summary statistics
print(summary_spending_loyalty)

# Boxplot: Loyalty Points by Spending Score Quantile

ggplot(tr_f, aes(x = spending_score_quantile, y = loyalty_points, fill = spending_score_quantile)) +
  geom_boxplot() +
  labs(title = "Loyalty Points by Spending Score Quantile",
       x = "Spending Score Quantile",
       y = "Loyalty Points") +
  theme_minimal()

# Scatter plot: Spending Score vs Loyalty Points
ggplot(tr_f, aes(x = spending_score, y = loyalty_points)) +
  geom_point(aes(color = spending_score_quantile), alpha = 0.6) +
  labs(title = "Spending Score vs Loyalty Points",
       x = "Spending Score",
       y = "Loyalty Points") +
  theme_minimal()

# Histogram of Loyalty Points by Spending Score Quantile
ggplot(tr_f, aes(x = loyalty_points, fill = spending_score_quantile)) +
  geom_histogram(binwidth = 50, alpha = 0.7, position = "dodge") +
  labs(title = "Histogram of Loyalty Points by Spending Score Quantile",
       x = "Loyalty Points",
       y = "Frequency") +
  theme_minimal()

# Interpret the result.
# The data shows that customers in the High spending group tend to accumulate more loyalty points. 
# From the result, it can be seen that there is a clear trend where customers in 
# the High spending group have significantly higher mean and median loyalty points compared 
# to those in the Low spending group. This indicates that the loyalty program at turtle games
# is rewarding higher spenders with more loyalty points.
# Consistency in Medium-Low and Medium-High Groups: Both the Medium-Low and Medium-High groups 
# have a relatively higher range of loyalty points compared to the Low group. 
# Medium-High group, in particular, shows a good balance between mean and median loyalty 
# points, suggesting more consistent loyalty point accumulation.
# In the Low spending group, there are some customers who accumulate disproportionately high loyalty points. 

# Recommendations
# The business could consider further incentivizing these high spenders to enhance loyalty.
# It would be worth investigating whether the high loyalty points accumulator in the low income group
# are incentivised by promotions.

###############################################################################
###############################################################################

# Assignment 6 scenario

## In Module 5, you were requested to redo components of the analysis using Turtle Games’s preferred 
## language, R, in order to make it easier for them to implement your analysis internally. As a final 
## task the team asked you to perform a statistical analysis and create a multiple linear regression 
## model using R to predict loyalty points using the available features in a multiple linear model. 
## They did not prescribe which features to use and you can therefore use insights from previous modules 
## as well as your statistical analysis to make recommendations regarding suitability of this model type,
## the specifics of the model you created and alternative solutions. As a final task they also requested 
## your observations and recommendations regarding the current loyalty programme and how this could be 
## improved. 


################################################################################

## Assignment 6 objective
## You need to investigate customer behaviour and the effectiveness of the current loyalty program based 
## on the work completed in modules 1-5 as well as the statistical analysis and modelling efforts of module 6.
##  - Can we predict loyalty points given the existing features using a relatively simple MLR model?
##  - Do you have confidence in the model results (Goodness of fit evaluation)
##  - Where should the business focus their marketing efforts?
##  - How could the loyalty program be improved?
##  - How could the analysis be improved?

################################################################################

## Assignment 6 assignment: Making recommendations to the business.

## 1. Continue with your R script in RStudio from Assignment Activity 5: Cleaning, manipulating, and 
##     visualising the data.
## 2. Load and explore the data, and continue to use the data frame you prepared in Module 5.
## 3. Perform a statistical analysis and comment on the descriptive statistics in the context of the 
##     review of how customers accumulate loyalty points.
##  - Comment on distributions and patterns observed in the data.
##  - Determine and justify the features to be used in a multiple linear regression model and potential
##.    concerns and corrective actions.
## 4. Create a Multiple linear regression model using your selected (numeric) features.
##  - Evaluate the goodness of fit and interpret the model summary statistics.
##  - Create a visual demonstration of the model
##  - Comment on the usefulness of the model, potential improvements and alternate suggestions that could 
##     be considered.
##  - Demonstrate how the model could be used to predict given specific scenarios. (You can create your own 
##     scenarios).
## 5. Perform exploratory data analysis by using statistical analysis methods and comment on the descriptive 
##     statistics in the context of the review of how customers accumulate loyalty points.
## 6. Document your observations, interpretations, and suggestions based on each of the models created in 
##     your notebook. (This will serve as input to your summary and final submission at the end of the course.)

################################################################################

# Your code here.


# 1. Load necessary libraries
library(ggplot2)
library(dplyr)

# 2. Check the first few rows of the data
head(tr_f)

# Get the structure and summary of the dataset
str(tr_f)
summary(tr_f)

# Check for missing values 
sapply(tr_f, function(x) sum(is.na(x)))  

# Install package
install.packages("moments")

# Load the package
library(moments)

# Compare the shape of loyalty_points data against normal distribution
qqnorm(tr_f$loyalty_points)
qqline(tr_f$loyalty_points)

# Data distribution normality test of loyalty_points
shapiro.test(tr_f$loyalty_points)

# Skewness
skewness(tr_f$loyalty_points)

# Kurtosis
kurtosis(tr_f$loyalty_points)

# The findings show the loyalty_points data is not normally distributed.
# The skewness is a positive score of 1.46 meaning the tail is more pronounced on the 
# right. This suggests that most values in the loyalty_points data are found on 
# the left side of the mean of 1578. As such, the most extreme values are found further 
# to the left. Kurtosis of 4.70 suggest that the loyalty_points data is heavy-tailed
# meaning that most of the contribution to the variance is coming from a handful
# of extreme data points.


# Compare the shape of remuneration data against normal distribution
qqnorm(tr_f$remuneration)
qqline(tr_f$remuneration)

# Data distribution normality test of remuneration
shapiro.test(tr_f$remuneration)

# Skewness
skewness(tr_f$remuneration)

# Kurtosis
kurtosis(tr_f$remuneration)

# The findings show the remuneration data is not normally distributed.
# The skewness is a positive score of 0.41 meaning the tail is more pronounced on the 
# right. This suggests that most values in the remuneration data are found on 
# the left side of the mean(48.08). As such, the most extreme values are found further 
# to the left. Kurtosis of 2.59 suggest that the age data is light-tailed.

# Compare the shape of age data against normal distribution
qqnorm(tr_f$age)
qqline(tr_f$age)

# Data distribution normality test of age
shapiro.test(tr_f$age)

# Skewness
skewness(tr_f$age)

# Kurtosis
kurtosis(tr_f$age)

# The findings show the age data is not normally distributed.
# The skewness is a positive score of 0.608 meaning the tail is more pronounced on the 
# right. This suggests that most values in the age data are found on 
# the left side of the mean(39.49). As such, the most extreme values are found further 
# to the left. Kurtosis of 2.80 suggest that the age data is light-tailed.

# Compare the shape of spending_score data against normal distribution
qqnorm(tr_f$spending_score)
qqline(tr_f$spending_score)

# Data distribution normality test
shapiro.test(tr_f$spending_score)

# Skewness
skewness(tr_f$spending_score)

# Kurtosis
kurtosis(tr_f$spending_score)

# The findings show the spending_score data is not normally distributed.
# The skewness is a negative score of -0.041 meaning the tail is more pronounced on the 
# left. This suggests that most values in the spending_score data are found on 
# the right side of the mean(50). As such, the most extreme values are found further 
# to the left. Kurtosis of 2.11 suggest that the spending_score data is light-tailed.


# 3. Visualize the distribution of key features
ggplot(tr_f, aes(x = loyalty_points)) + geom_histogram(binwidth = 10, fill = "blue", color = "black") +
  labs(title = "Distribution of Loyalty Points")

ggplot(tr_f, aes(x = spending_score)) + geom_histogram(binwidth = 10, fill = "green", color = "black") +
  labs(title = "Distribution of Spending Score")

ggplot(tr_f, aes(x = remuneration)) + geom_histogram(binwidth = 5, fill = "purple", color = "black") +
  labs(title = "Distribution of Remuneration")

# 4. Correlation matrix
cor(tr_f %>% select_if(is.numeric))

# Explain the result.
# Moderate positive correlations are seen between remuneration and loyalty_points(.616), and between 
# spending_score and loyalty_points(.672).Other correlations are either weak or negligible, 
# meaning the relationships between these variables with loyalty_points are either weak or non-existent 
# in a linear sense.

# Visualize the relationships (e.g., scatter plots)
ggplot(tr_f, aes(x = spending_score, y = loyalty_points)) + geom_point() + geom_smooth(method = "lm")

ggplot(tr_f, aes(x = remuneration, y = loyalty_points)) + geom_point() + geom_smooth(method = "lm")

# 5. Fit the multiple linear regression model
final_model <- lm(loyalty_points ~ spending_score + remuneration, data = tr_f)

# Check model summary
summary(final_model)

# Explain the result.
# The multiple linear regression model is statistically significant, with a high R-squared value(.8269). 
# This indicates a good fit. Both predictors (spending_score and remuneration) have strong and statistically 
# significant effects on the dependent variable(loyalty_points).The residuals are fairly well-distributed, 
# though the model might slightly overestimate or underestimate in some cases (as indicated by the median of 40.34).


# 6. Visualize the regression for spending_score
ggplot(tr_f, aes(x = spending_score, y = loyalty_points)) + 
  geom_point() + 
  geom_smooth(method = "lm", color = "red")

# Visualize the regression for remuneration
ggplot(tr_f, aes(x = remuneration, y = loyalty_points)) + 
  geom_point() + 
  geom_smooth(method = "lm", color = "red")




###############################################################################
###############################################################################




