df <- read.csv(header = F, "data/day_01.1.txt")

sum(df$V1 - dplyr::lag(df$V1) > 0, na.rm = T)

sums <- slider::slide_dbl(df$V1, sum, .before = 1, .after = 1, .complete = T)
sum(sums - dplyr::lag(sums) > 0, na.rm = T)
