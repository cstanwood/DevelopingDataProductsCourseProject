library(shiny)
library(tidyverse)
library(data.table)
library(stats)

regions <- c(
  "Canada",
  "British Columbia",
  "Alberta",
  "Saskatchewan",
  "Manitoba",
  "Ontario",
  "Quebec",
  "Nova Scotia",
  "New Brunswick",
  "Newfoundland and Labrador"
)
regionLabel<-"Select Region:"

genders <-  c(
  "Both" = "Both sexes",
  "Female" = "Females", 
  "Male" = "Males"
)
genderLabel <- "Select Gender:"

selectAllLabel <- "All"
selectNoneLabel <- "None"
