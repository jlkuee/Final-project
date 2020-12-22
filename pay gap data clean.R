setwd("/Users/sunyiyun/Desktop/sta304/final project")
data <- read_csv("/Users/sunyiyun/Desktop/sta304/final project/Glassdoor Gender Pay Gap.csv")
library(tidyverse)
library(knitr)

data <- data %>%
  rename(jobtitle = JobTitle) %>%
  rename(gender = Gender) %>%
  rename(age = Age) %>%
  rename(perfeval = PerfEval) %>%
  rename(dept = Dept) %>%
  rename(seniority = Seniority) %>%
  rename(education = Education) %>%
  mutate(salary = BasePay + Bonus) %>%
  mutate(gender_F = ifelse(gender == "Female", 1, 0)) %>%
  drop_na()

data$seniority <- as.factor(data$seniority)

write_csv(data, "pay_gap_data.csv")
  