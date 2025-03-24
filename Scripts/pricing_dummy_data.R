# PROJECT: Finance_redo
# AUTHOR: Kirstin Lyon
# DESCRIPTION:  Dummy data for pricing dashboard
# LICENSE: MIT
# DATE: 2020-06-02


# Load libraries ---------------------------------------------------------------

library(dplyr)
library(tidyr)
library(readr)
library(stringr)


# GLOBAL VARIABLES -----------------------------------------------------------


#set seed for reporoducibility
set.seed(1234)

NUM_CUSTOMERS <- 10
NUM_OFFICES <- 3
NUM_EMPLOYEES <- 3
START_DATE <- as.Date("2020-01-01")
END_DATE <- as.Date("2020-03-31")
PERIOD <- seq(START_DATE, END_DATE, by = "month")  # All dates in 2024

#create 

num_employees_per_office <- sample(NUM_EMPLOYEES, NUM_OFFICES, replace = TRUE)

data <- expand.grid(
  office_id = 1:NUM_OFFICES,
  period = PERIOD
) |> 
    rowwise() |> 
    mutate(
        num_employees = num_employees_per_office[office_id],
        employee_id = list(paste0("name",1:num_employees))
    ) |> 
    unnest(employee_id) |> 
    #rename employee_id so it's the same number as the row
    mutate(employee_id = row_number()
           )
        
        
  #      employee_name = starwars$name[employee_id]
  #         )

starwars

