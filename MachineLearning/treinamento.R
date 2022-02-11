df <- read.csv("fipe_transformada.csv", sep = ",", encoding = "UTF-8")
View(df)

df$veiculo <- as.factor(df$veiculo)
df$marca <- as.factor(df$marca)
df$nome <- as.factor(df$nome)
df$cambio <- as.factor(df$cambio)
df$cilindradas <- as.factor(df$cilindradas)
df$combustivel <- as.factor(df$combustivel)
df$ano <- as.factor(df$ano)
str(df)

# 70% para treinamento e 30% para teste
length(df$marca)*0.7

treino = df[1:13698,]
teste = df[3699:19569,]

sample(1:6,2)

sample(1:19569,13698) # 13698 são 70% do df, 19569 é o tamanho do df
linhas <- sample(1:length(df$marca), length(df$marca)*0.7)

set.seed(100)

df$veiculo <- NULL

treino = df[linhas,]
View(treino)

teste = df[-linhas,]
View(teste)

length(treino$marca)+length(teste$marca)

### Criar modelo ###

library(rpart)
modelo <- rpart(preco ~ ., data = treino, control=rpart.control(cp=0))
View(modelo)

teste$previsao <- predict(modelo, teste)
View(teste)

### Análise de resultados ###
teste$P <- round(teste$previsao/teste$preco, 2)
teste$P <- teste$P-1
teste$P <- abs(teste$P)
R_1 <- summary(teste$P)
R_1


summary(treino$preco)

quantile(df$preco,0.9)

hist(df$preco[df$preco< quantile(teste$preco,0.9)], breaks=10)

R_Final_1 <- summary(teste$P[teste$preco > 10000 & teste$preco < 70000])
R_1
R_Final_1




