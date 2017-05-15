#merge satellite data Molopo
library(raster)

main <- "E:/HK_Geoinfo/"
data <- paste0(main, "data/")

#test
drgb <- paste0(data, "2013_rgb/")
files <- list.files(drgb)

s1 <- stack(paste0(drgb,files[2]))
s2 <- stack(paste0(drgb,files[4]))
s3 <- stack(paste0(drgb,files[6]))

s1@
bstack <- merge(s1,s2,s3)


rgb2013 <- merge(s1,s2,s3)
writeRaster(rgb2013, paste0(drgb,"rgb2013.tif"))

#L8 2013
#no, nw, so indicate tile position; d=dry season, r = rainy season

#dry season
nod <- paste0(data,"173078/LC08_L1TP_173078_20130627_20170504_01_T1/")
nwd <- paste0(data,"174078/LC08_L1TP_174078_20130720_20170503_01_T1/")
sod <- paste0(data,"173079/LC08_L1TP_173079_20130627_20170504_01_T1/")

bands <- c(2, 3, 4, 5, 6, 7, 10, 11)
tiles <- c(nod, nwd, sod)

i=2
j=2

#tb = tilebands; tdir = tiledirectory
tb <- character()
stacklist <- lapply(seq(tiles), function (j){ #3x, für alle Kacheln
  for (i in seq(bands)){ ##für jeden in Sequenz 2,3,4,...,10,11
    tb[i] <- paste0(tiles[j],list.files(tiles[j], pattern =
                                          paste0("\\B",toString(bands[i]),".TIF$")))}
  ###liste alle, die für die jeweilige Kachel die enstprechenden 
  ###Bänder haben
  st <- stack(tb) ##stacke alle Bänder einer Kachel
})

plot(stacklist[[2]])

