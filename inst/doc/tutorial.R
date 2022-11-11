## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_mailchimp_data.RData")

## ----setup--------------------------------------------------------------------
library(mailchimpR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_mailchimp_data <-
#    fetch_mailchimp(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_mailchimp_data)

## -----------------------------------------------------------------------------
ggplot(my_mailchimp_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_mailchimp_data, family = "poisson")
summary(lmod)

