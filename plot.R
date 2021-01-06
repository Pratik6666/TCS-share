tcs_data <- read.csv("08-01-2020-TO-06-01-2021TCSALLN.csv")
infy_data <- read.csv("08-01-2020-TO-06-01-2021INFYALLN.csv")
wipro_data <- read.csv("08-01-2020-TO-06-01-2021WIPROALLN.csv")
nifty_data <- read.csv("NIFTY.csv")
nifty_it_data <- read.csv("NIFTY IT.csv")

closing_price_df <- data.frame(Date = as.Date(tcs_data$Date, "%d-%m-%y"), TCS = tcs_data$Close.Price, INFY = infy_data$Close.Price,
                               WIPRO = wipro_data$Close.Price, NIFTY = nifty_data$Close, 
                               NIFTY_IT = nifty_it_data$Close)

library(tidyverse)

TCS_closing_data <- data.frame(Date = as.Date(tcs_data$Date, "%d-%m-%y"), Closing = tcs_data$Close.Price )
TCS_closing_data <- data.frame (TCS_closing_data %>% 
  select(Date, Closing) %>% 
  mutate(Company = "TCS"))

INFY_closing_data <- data.frame(Date = as.Date(infy_data$Date, "%d-%m-%y"), Closing = infy_data$Close.Price )
INFY_closing_data <- data.frame (INFY_closing_data %>% 
                                  select(Date, Closing) %>% 
                                  mutate(Company = "INFY"))

WIPRO_closing_data <- data.frame(Date = as.Date(wipro_data$Date, "%d-%m-%y"), Closing = wipro_data$Close.Price )
WIPRO_closing_data <- data.frame (WIPRO_closing_data %>% 
                                   select(Date, Closing) %>% 
                                   mutate(Company = "WIPRO"))

NIFTY_closing_data <- data.frame(Date = as.Date(nifty_data$Date, "%d-%m-%y"), Closing = nifty_data$Close )
NIFTY_closing_data <- data.frame (NIFTY_closing_data %>% 
                                    select(Date, Closing) %>% 
                                    mutate(Company = "NIFTY"))

NIFTY_IT_closing_data <- data.frame(Date = as.Date(nifty_it_data$Date, "%d-%m-%y"), Closing = nifty_it_data$Close )
NIFTY_IT_closing_data <- data.frame (NIFTY_IT_closing_data %>% 
                                    select(Date, Closing) %>% 
                                    mutate(Company = "NIFTY IT"))

closing_price_df_without_index <- bind_rows(TCS_closing_data, INFY_closing_data, WIPRO_closing_data)
closing_price_df_without_index 



closing_price_df <- bind_rows(TCS_closing_data, INFY_closing_data, WIPRO_closing_data,
                              NIFTY_closing_data, NIFTY_IT_closing_data)

closing_price_df %>% 
  ggplot(aes( x = Date, y = Closing, color = Company)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90))

