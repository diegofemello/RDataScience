setwd("C:/Users/DFMELLO/Documents/RDataScience/MachineLearning")

df <- read.csv("fipe_Jun2018.csv", sep = ",", encoding = "UTF-8")
View(df)

class(df)

# excluindo colunas desnecessárias
df$X <- NULL
df$price_reference <- NULL

View(df)

# alterar nomes das colunas
names(df)
names(df) <- c("marca", "veiculo", "ano", "combustivel", "preco")

View(df)

summary(df)
df$ano[df$ano == 32000] <- "Zero KM"
df$ano <- as.factor(df$ano)

summary(df$ano)
str(df$ano)

df$preco <- gsub("R\\$|\\.| ", "", df$preco)
df$preco <- as.numeric(gsub("\\,", ".", df$preco))
View(df)
summary(df$preco)



library(stringr)
df$cilindradas <- str_extract(df$veiculo, "[0-9]\\.[0-9]")
df$cilindradas <- as.factor(df$cilindradas)
str(df$cilindradas)
summary(df$cilindradas)
unique(df$veiculo[is.na(df$cilindradas)])

df %>%
  filter(is.na(cilindradas)) %>%
  select(veiculo) %>%
  distinct()

aut <- subset(df, str_detect(df$veiculo, " Aut\\."), "veiculo") 
aut <- unique(aut)
aut$cambio <- "Aut"
View(aut)

df <- left_join(df, aut)

mec <- subset(df, str_detect(df$veiculo, " Mec\\."), "veiculo")
mec <- unique(mec)
mec$cambio <- "Mec"
View(mec)

df <- left_join(df, mec, by="veiculo")

df$cambio.x <- NULL
df$cambio.y <- NULL

df$cambio[is.na(df$cambio)] <- "Mec"
str(df$cambio)
df$cambio <- as.factor(df$cambio)

library(tidyr)
df <- separate(df, "veiculo", into="nome", sep=" ", remove = FALSE)
df$nome <- as.factor(df$nome)

str(df$nome)
str(df)
df <- na.omit(df)

write.table(df, file="fipe_transformada.csv", sep=",", row.names=FALSE, col.names=TRUE, fileEncoding = "UTF-8")
















View(df)

