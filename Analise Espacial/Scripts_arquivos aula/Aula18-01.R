sf_shoppings %>%
  filter(regiao == "sul")

sf_shoppings$geometry


plot(sf_shoppings)

# Bounding box:  xmin: -46.75752 ymin: -23.6783 xmax: -46.47064 ymax: -23.47987

shoppings$longitude %>% min()
shoppings$longitude %>% max()


attributes(sf_shoppings$geometry)
attr(sf_shoppings$geometry, which = "crs")


spTransform(shp_saopaulo, 
  CRSobj = "+proj=utm +zone=18 +north") -> shp_errado


spTransform(shp_saopaulo, 
  CRSobj = "+proj=utm +zone=18 +north +unit=m") -> shp_errado

plot(shp_errado)
plot(shp_saopaulo)
