df <- read.csv("fipePrevAjustada.csv", sep = ",", encoding = "UTF-8")
View(df)

install.packages("tidyverse")

# Média de preços
mean(df$preco)

# Selecionando os 50 primeiros registros
df %>% head(50)

# Selecionando os 50 últimos registros
df %>% tail(50)

library(dplyr)

names(df) <- c("Marca", "Carro", "Ano_Modelo","Combustivel", "Preco", "Cilindradas", "Cambio")


df$Carro <- as.factor(df$Carro)
levels(df$Carro)

MediaMarca <- df %>% filter(Ano_Modelo=="Zero KM") %>%
  group_by(Marca) %>%
  summarise(mean(Preco))

names(MediaMarca) <- c("Marca", "Media")
View(MediaMarca)
