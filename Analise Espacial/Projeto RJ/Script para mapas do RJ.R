######### Mapa do RJ #########

pacotes <-  c("rgdal","plotly","tidyverse","knitr","kableExtra","gridExtra",
              "png","grid","magick","rgl","devtools","GISTools","rayshader",
              "tmap","broom","rgdal","plotly","tidyverse","knitr","kableExtra","gridExtra",
              "png","grid","magick","rgl","devtools","GISTools","rayshader",
              "tmap","broom","tidyverse","sf","tmap","rgdal","rgeos","adehabitatHR","knitr",
              "kableExtra")

if(sum(as.numeric(!pacotes %in% installed.packages())) != 0){
  instalador <- pacotes[!pacotes %in% installed.packages()]
  for(i in 1:length(instalador)) {
    install.packages(instalador, dependencies = T)
    break()}
  sapply(pacotes, require, character = T) 
} else {
  sapply(pacotes, require, character = T) 
}
# eu sei que tem muitos pacotes, até mais do que precisa para o que está sendo feito
# mas se você quiser fazer qualquer outra análise, em algum momento algum desses pacotes vai acabar sendo útil


shp_rj_bairro <- readOGR(dsn = "shapefile_rj",layer = "Limite_Bairro",
                         encoding = "UTF-8",use_iconv = T)
## o arquivo de Bairros está com algum problema, não sei qual exatamente.
## ele funciona sozinho, mas se você tentar adicionar ele nos outros mapas ele simplesmente não deixa.

shp_rj_mun <- readOGR(dsn = "shapefile_rj",layer = "RJ_Municipios_2020",
                      encoding = "UTF-8",use_iconv = T)
# shapefile dos municípios do RJ


shp_rj_uf <- readOGR(dsn = "shapefile_rj",layer = "RJ_UF_2020",
                         encoding = "UTF-8",use_iconv = T)
# shapefile apenas do estado do RJ

shp_rj_reg <- readOGR(dsn = "shapefile_rj",layer = "RJ_Microrregioes_2020",
                         encoding = "UTF-8",use_iconv = T)
# shapefile com as microrregiões (há também o arquivo de mesorregiões no IBGE)

# todos os shapefiles com exceção do shapefile de bairros foram baixados no site do IBGE.


shp_rj_df_mun <- tidy(shp_rj_mun, region = "NM_MUN")

shp_rj_df_bairro <- tidy(shp_rj_bairro, region = "CODBAIRRO")

shp_rj_df_uf <- tidy(shp_rj_uf, region = "NM_UF")

shp_rj_df_reg <- tidy(shp_rj_reg, region = "NM_MICRO")
## acima apenas fiz a transformação para um objeto tipo dataframe para poder usar o ggplot



ggplot()+
  geom_polygon(data = shp_rj_df_uf, mapping = aes(x = long, y = lat, group = group), color = "black",fill = "white")+
  geom_polygon(data = shp_rj_df_mun, mapping = aes(x = long, y = lat, group = group), color = "black",fill = "white")+
  geom_polygon(data = shp_rj_df_reg, mapping = aes(x = long, y = lat, group = group, fill = id),color = "red",alpha = 0.4)

# geom_polygon é o geom responsável por fazer as formas usando os polígonos do arquivo shapefile
# essa sintaxe group = group é estranha, mas é necessária para o gráfico fazer sentido.

# mexam a vontade.


