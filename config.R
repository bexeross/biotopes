
delphi_prosjekt_drive <- "U:" # which letter have you mapped this drive to?

dataPath <- file.path(delphi_prosjekt_drive,"Mareano/VIDEOLAB/VIDEO DATA/200m_scale_species_by_sample/Data_Delivery_2021")
outPath <- file.path(dataPath,"outputs")
codePath <- getwd()

## Some functions

utmize <- function(x){
  require(rgdal)
  proj4string(x)=CRS("+init=epsg:4326")
  result <- spTransform(x, CRS("+init=epsg:32633")) 
  return(result)
}
