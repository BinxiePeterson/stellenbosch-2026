
# CHALLENGE 1 -------------------------------------------------------------

# 1.1. Run the following code and indicate what the values
# are after each statement:

r_length <- 2.5
# r_length = ?

r_width <- 3.2
# r_width = ?

r_area <- r_length * r_width
# r_area = ?

r_length <- r_length * 2.0
# r_length = ?

r_area
# r_area = ?

# . -----------------------------------------------------------------------


# CHALLENGE 2 -------------------------------------------------------------

# 2.1. What will happen in each of the following examples
# (hint: use class() to check data type or look at the environment)

num_char <- c(1, 2, 3, "a")
# class(num_char)

num_logical <- c(1, 2, 3, TRUE)
# class(num_logical)

char_logical <- c("a", "b", "c", TRUE)
# class(char_logical)

tricky <- c(1, 2, 3, "4")
# class(tricky)

# . -----------------------------------------------------------------------


# CHALLENGE 3 -------------------------------------------------------------

# 3.1. Can you figure out why "four" > "five" returns TRUE
# when you run the following code?

"four" > "five"

# . -----------------------------------------------------------------------


# CHALLENGE 4 -------------------------------------------------------------

# 4.1. Use the following vector (number of rooms) and create a new vector
# (called "rooms_no_na") with NAs removed.

rooms <- c(1, 2, 1, 1, NA, 3, 1, 3, 2, 1, 1, 8, 3, 1, NA, 1)

rooms_no_na <- ?


# 4.2. Calculate the median (using the median() function) of the new rooms_no_na vector.



# 4.3. How many households in the set use more than 2 rooms for sleeping?
# Hint: Use conditional subsetting and the length() function

rooms_above_2 <- ?

# . -----------------------------------------------------------------------



# CHALLENGE 5 -------------------------------------------------------------


# Based on output of str(interviews), answer the following:
str(interviews)

# 5.1. What is the data structure of the object surveys?


# 5.2. How many rows and columns are in this object?


# . -----------------------------------------------------------------------


# CHALLENGE 6 -------------------------------------------------------------

# 6.1. Create a tibble (`interviews_100`) containing only
#    row 100 of the `interviews` dataset.
interviews_100 <- ?  # extract observations from row 100

# 6.2. Notice how `nrow(surveys)` gave you the number of rows in the tibble?
#    6.2.1. Use that number to pull out just that last row in the tibble.
n_rows <- nrow(interviews)  # get the number of rows in surveys dataset
interviews_last <- ?

#    6.2.2. Compare that with what you see as the last row using `tail()`
#         to make sure it's meeting expectations.


# 6.3. Use `nrow()` to extract the row that is in the middle of the tibble.
#    Store the content of this row in an object named `interviews_middle`.
interviews_middle <- ?

# 6.4. Combine `nrow()` with the `-` notation above to reproduce the behavior of
#   `head(interviews)` keeping just the first through 6th rows of the interviews dataset.


# . -----------------------------------------------------------------------



# CHALLENGE 7 -------------------------------------------------------------

# 7.1. Rename the levels of the factor to have the first letter in uppercase:
# “No”,“Undetermined”, and “Yes”.

memb_assoc <- fct_recode(memb_assoc,
                         No = "no",
                         Undetermined = "undetermined",
                         Yes = "yes")


# 7.2. Check that the levels have been renamed


# 7.3. Recreate the bar plot such that "Undetermined" is last (after "Yes")

# . -----------------------------------------------------------------------

# CHALLENGE 8 -------------------------------------------------------------

# Instead of creating a data frame with read.csv(), you can create your own using data.frame()

# 8.1. The following code has a few mistakes. Try to fix it.

# Now fix the code:
animal_data <- data.frame(animal=c(dog, cat, sea cucumber, sea urchin),
                          feel=c("furry", "squishy", "spiny"),
                          weight=c(45, 8 1.1, 0.8))
animal_data


# 8.2. What would you need to change in the following code to ensure that
#      each column had the accurate data type?

country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                              climate=c("cold", "hot", "temperate", "hot/temperate"),
                              temperature=c(10, 30, 18, "15"),
                              northern_hemisphere=c(TRUE, TRUE, FALSE, "FALSE"),
                              has_kangaroo=c(FALSE, FALSE, FALSE, 1))

str(country_climate)

# . -----------------------------------------------------------------------


# CHALLENGE 9 -------------------------------------------------------------

# Using pipes, subset the interviews data to include interviews where respondents
# were members of an irrigation association (memb_assoc) and retain only the columns
# affect_conflicts, liv_count, and no_meals.

interviews %>%
  filter(?) %>%
  select(?)


# . -----------------------------------------------------------------------


# CHALLENGE 10 ------------------------------------------------------------

# Create a new dataframe from the interviews data that meets the following criteria:
# * contains only the village column and a new column called total_meals
# * the total_meals column must contain a value that is equal to the total number of meals
#   served in the household per day on average (no_membrs times no_meals).
# * Only the rows where total_meals is greater than 20 should be shown in the final dataframe.

# Hint: think about how the commands should be ordered to produce this data frame!

interviews_total_meals <- ?

# . -----------------------------------------------------------------------


# CHALLENGE 11 ------------------------------------------------------------

# 11.1. How many households in the survey have an average of two meals per day?


# 11.2. Use group_by() and summarize() to find the mean, min, and max number of
# household members for each village. Also add the number of observations.
# (hint: see ?n)


# 11.3. What was the largest household interviewed in each month?

library(lubridate) # load lubridate if not already loaded

# If not already included, add month, year, and day columns

# . -----------------------------------------------------------------------



# CHALLENGE 12 ------------------------------------------------------------

# 12.1. We created interviews_items_owned by reshaping the data: first longer and then wider.
# Make a table showing the number of respondents in each village who owned
# a particular item, and include all items. The difference between this format
# and the wide format is that you can now count all the items using the
# items_owned variable.


# . -----------------------------------------------------------------------


# CHALLENGE 13 ------------------------------------------------------------

# Use what you just learned to create a scatter plot of rooms by village
# with the respondent_wall_type showing in different colours.
# Does this seem like a good way to display the relationship between these variables?
# What other kinds of plots might you use to show this type of data?

# . -----------------------------------------------------------------------


# CHALLENGE 14 ------------------------------------------------------------

# 14.1. Boxplots are useful summaries, but hide the *shape* of the distribution.
# Replace the boxplot with a violin plot to see the shape; see geom_violin()


# 14.2. Create a boxplot for liv_count for each wall type.
# Overlay the boxplot layer on a jitter layer to show actual measurements.


# 14.3. Add colour to the data points on your boxplot according to whether
# the respondent is a member of an irrigation association (memb_assoc).


# . -----------------------------------------------------------------------


# CHALLENGE 15 ------------------------------------------------------------

# Create a bar plot showing the proportion of respondents in each village who
# are or are not part of an irrigation association (memb_assoc). Include
# only respondents who answered that question in the calculations and plot.
# Which village had the lowest proportion of respondents in an irrigation association?

percent_memb_assoc <- interviews_plotting %>%
  filter(!is.na(memb_assoc)) %>%
  count(village, memb_assoc) %>%
  group_by(village) %>%
  mutate(percent = (n / sum(n)) * 100) %>%
  ungroup()


# . -----------------------------------------------------------------------


# CHALLENGE 16 ------------------------------------------------------------

# Try to improve one of the plots generated in
# this exercise or make one of your own

# Some ideas:
# Change the thickness of the lines
# Change the name of the legend and the labels
# Try using a different color palette (http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/)


# . -----------------------------------------------------------------------

