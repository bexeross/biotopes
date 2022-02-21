## export species shapefile for inspection in GIS

gisit <- function(sp){
  species1 <- trimmedwide %>%
    select(sp)%>%
    left_join(sample_info)%>%
    select(SampID, sp, x_coord, y_coord)%>%
    mutate(presence=decostand(across(sp),method="pa"))%>%
    filter(presence==1)
  species1_spat <- SpatialPointsDataFrame(coords = species1[,c(3,4)],
                                          data = species1[,-5],
                                          proj4string = CRS("+proj=utm +zone=33 +datum=WGS84 +units=m +no_defs"))
  writeOGR(species1_spat,dsn = file.path(dataPath, "outputs\\Spatial"),
           layer = sp,
           driver = "ESRI Shapefile")
}

