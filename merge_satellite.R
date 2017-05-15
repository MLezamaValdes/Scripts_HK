#MERGE SATELLITE DATA MOLOPO

library(raster)

#paths
main <- "E:/HK_Geoinfo/"
data <- paste0(main, "data/")

#L8 2013
#no, nw, so indicate tile position; d=dry season, r = rainy season

#DRY SEASON
nod <- paste0(data,"173078/LC08_L1TP_173078_20130627_20170504_01_T1/")
nwd <- paste0(data,"174078/LC08_L1TP_174078_20130720_20170503_01_T1/")
sod <- paste0(data,"173079/LC08_L1TP_173079_20130627_20170504_01_T1/")

bands <- c(2, 3, 4, 5, 6, 7, 10, 11)
tiles <- c(nod, nwd, sod)

#build list of 3 stacks with all bands in all tiles
tb <- character()
dst <- lapply(seq(tiles), function (j){
  for (i in seq(bands)){ 
    tb[i] <- paste0(tiles[j],list.files(tiles[j], pattern =
                                          paste0("\\B",toString(bands[i]),".TIF$")))}
  st <- stack(tb) 
})

#RAINY SEASON
nor <- paste0(data,"173078/LC08_L1TP_173078_20131204_20170428_01_T1/")
nwr <- paste0(data,"174078/LC08_L1TP_174078_20131227_20170427_01_T1/")
sor <- paste0(data,"173079/LC08_L1TP_173079_20131204_20170428_01_T1/")

#build list of 3 stacks with all bands in all tiles
tb <- character()
rst <- lapply(seq(tiles), function (j){
  for (i in seq(bands)){ 
    tb[i] <- paste0(tiles[j],list.files(tiles[j], pattern =
                                          paste0("\\B",toString(bands[i]),".TIF$")))}
  st <- stack(tb)
})
