
delphi_prosjekt_drive <- "U:" # which letter have you mapped this drive to?

dataPath <- file.path(delphi_prosjekt_drive,"Mareano/VIDEOLAB/VIDEO DATA/200m_scale_species_by_sample/Data_Delivery_2021")
outPath <- file.path(dataPath,"outputs")
codePath <- getwd()

## Some functions

#convert geographic coordinates in WGS84 to UTM33N

utmize <- function(x){
  require(rgdal)
  proj4string(x)=CRS("+init=epsg:4326")
  result <- spTransform(x, CRS("+init=epsg:32633")) 
  return(result)
}

#Compute mean abundance of all species present in all samples of a given class in a given classification

classreport <- function(data, classifications, level, class){
  aa <- paste0("level",level)
  id <- classifications %>% 
    filter(get(aa)==class) %>%
    select(SampID) %>%
    pull()
  spp <- data %>% filter(SampID %in% id) %>%
    select(-1) %>%
    select_if(colSums(.)>0)
  return(sort(colMeans(spp), decreasing = TRUE))
}