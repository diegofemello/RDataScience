# Base de dados
df <- data.frame(
  Pessoa = seq(1:300),
  Idade = NA,
  Peso = NA,
  Altura = NA,
  Emprego = NA
)

df$Idade <- sample(20:60, 300, replace = TRUE)
df$Peso <- sample(45:120, 300, replace = TRUE)
df$Altura <- sample(1.50:1.95, 300, replace = TRUE)
df$Emprego <- sample(0:1, 300, replace = TRUE)
# df$Emprego <- sample(c("Desempregado", "Empregado", "Autônomo"), 300, replace = TRUE)

# Tratando dados missing
View(df)
