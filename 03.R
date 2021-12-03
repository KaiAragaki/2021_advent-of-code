library(tidyverse)

df <- read_csv(col_names = F, "data/03.txt") |> 
  mutate(thing = str_split(X1, "")) |> 
  select(-X1) |> 
  mutate(thing = map(thing, as.numeric)) |> 
  unnest()

m <- matrix(df$thing, ncol = 12, byrow = TRUE)



sums <- m |> colSums()
g <- (sums > 500) |> as.numeric()
e <- abs(g-1)

1916*2179

# Part 2 -----------------------------------------------------------------------

t <- m |> as_tibble()

get_common <- function(x) {
  as.numeric(sum(x)/nrow(x) >= .5) 
}

n <- t

for (col in 1:ncol(n)) {
  common <- get_common(n[,col])
  print(common)
  n <- dplyr::filter(n, n[,col] == common)
}
print(n)

get_uncommon <- function(x) {
  as.numeric(sum(x)/nrow(x) < .5) 
}

n <- t

for (col in 1:ncol(n)) {
  print(n)
  uncommon <- get_uncommon(n[,col])
  print(uncommon)
  n <- dplyr::filter(n, n[,col] == uncommon)
}
print(n)
