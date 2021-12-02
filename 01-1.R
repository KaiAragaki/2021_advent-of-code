df <- read.csv(header = F, "data/day_01.1.txt")
sum(df$V1 - dplyr::lag(df$V1) > 0, na.rm = T)
