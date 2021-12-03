library(dplyr)
library(tidyr)
library(purrr)

df <- read.delim("data/02.txt", header = F, sep = " ", col.names = c("name", "v"))

df |> 
  group_by(name) |> 
  summarise(value = sum(v)) |> 
  pivot_wider() |> 
  mutate(ans = (down - up) * forward)

# Part 2 -----------------------------------------------------------------------

df2 <- df |> 
  mutate(aim = case_when(name == "forward" ~ 0L,
                         name == "down" ~ v,
                         name == "up" ~ -v) |> 
           accumulate(sum),
         fwd = ifelse(name == "forward", v, 0),
         depth = fwd*aim)

sum(df2$fwd)*sum(df2$depth)
