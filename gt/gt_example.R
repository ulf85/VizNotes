library(gt)

mydf <- data.frame(KPI1 = 3.6123, KPI2 = 5.235, count = 12345, KPI1_2 = 3.457, KPI2_2 = 5.8132, count_2 = 12344)
mydf$diffKPI1 <- mydf$KPI1_2 - mydf$KPI1
mydf$diffKPI2 <- mydf$KPI2_2 - mydf$KPI2

mydf %>% gt() %>%
  fmt_number(columns = vars(KPI1, KPI2, KPI1_2, KPI2_2, diffKPI1, diffKPI2),
             decimals = 2) %>%
  tab_spanner(label = "solution 1", columns = vars(KPI1, KPI2, count)) %>%
  tab_spanner(label = "solution 2", columns = vars(KPI1_2, KPI2_2, count_2)) %>%
  tab_spanner(label = "Difference", columns = vars(diffKPI1, diffKPI2)) %>%
  tab_header(title = "Stats of my project") %>%
  cols_label(KPI1_2 = "KPI1",
             KPI2_2 = "KPI2",
             diffKPI1 = "Diff KPI1",
             diffKPI2 = "Diff KPI2",
             count_2 = "count") %>%
  data_color(columns = vars(diffKPI1), 
             colors = function(x){ifelse(x<0,"red","green")})


mydf <- data.frame(KPI1 = 3.6123, KPI2 = 5.235, count = 12345, KPI1_2 = 3.457, KPI2_2 = 5.8132, count_2 = 12344)
mydf$diffKPI1 <- mydf$KPI1_2 - mydf$KPI1
mydf$diffKPI2 <- mydf$KPI2_2 - mydf$KPI2

mydf <- rbind(mydf, mydf)

mydf %>% gt() %>%
  fmt_number(columns = vars(KPI1, KPI2, KPI1_2, KPI2_2, diffKPI1, diffKPI2),
             decimals = 2) %>%
  tab_spanner(label = "solution 1", columns = vars(KPI1, KPI2, count)) %>%
  tab_spanner(label = "solution 2", columns = vars(KPI1_2, KPI2_2, count_2)) %>%
  tab_spanner(label = "Difference", columns = vars(diffKPI1, diffKPI2)) %>%
  tab_header(title = "Stats of my project") %>%
  cols_label(KPI1_2 = "KPI1",
             KPI2_2 = "KPI2",
             diffKPI1 = "Diff KPI1",
             diffKPI2 = "Diff KPI2",
             count_2 = "count") %>%
  data_color(columns = vars(diffKPI1, diffKPI2), 
             colors = function(x){ifelse(x<0,"red","green")})
