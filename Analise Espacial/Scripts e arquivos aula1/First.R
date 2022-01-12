x <- rnorm(100)
y <- rnorm(100)

df <- data.frame(x, y)

head(df)
df$x <- df$x + 50

head(df)


shp_sp@data$NM_MUNICIP
shp_sp@data$CD_GEOCMU

shp_sp@polygons
shp_sp@plotOrder

shp_sp@bbox

shp_sp@data$NM_MUNICIP[33]
shp_sp@data[33, ]


shp_sp@data["area_aproximada"] <- area(shp_sp) / 1000000

shp_sp@data$NM_MUNICIP[33]

shp_dados_df <- tidy(shp_dados_sp, region = "CD_GEOCMU") %>% 
  rename(CD_GEOCMU = id) %>% 
  left_join(shp_dados_sp@data,
            by = "CD_GEOCMU")

passo1 <- tidy(shp_sp, region = "CD_GEOCMU")
View(passo1)

passo2 <- rename(passo1, CD_GEOCMU = id)  

passo3 <- left_join(passo2, shp_dados_sp@data, by = "CD_GEOCMU")

View(passo3)
