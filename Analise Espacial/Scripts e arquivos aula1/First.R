x <- rnorm(100)
y <- rnorm(100)

df <- data.frame(x, y)

head(df)
df$x <- df$x + 50

head(df)
