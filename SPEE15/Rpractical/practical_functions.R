# Conversion of date to integer (seconds since 1900/1/1)
AbsoluteTime <- function(date) as.numeric(difftime(date,as.POSIXct("1900-1-1",tz='UTC'),units="secs"))
POSIXctTime<-function(abstime) as.POSIXct("1900-1-1",tz='UTC')+abstime

# returns the time of sunrise and sunset for a given date
SunRiseSet = function(date,lat=52.927336,lon=4.849632){
  sunrise.set(lat,lon,strftime(date,format="%Y/%m/%d"))
}

# define a raster
mkraster = function( data=NULL, resolution=100, rng = 'core', spatpix = TRUE  )
{
  if(is.null(data))
  {
    if(rng=='core')
    {
      xl=c(114000,121000)
      yl=c(547000,555000)
    }
    if(rng=='full')
    {
      xl = c(107020, 133040)
      yl = c(544000,563020)    
    }  
    if(rng=='texel')
    {
      xl = c(104000, 125000)
      yl = c(550000,580000)    
    }
    if(rng=='wadden')
    {
      xl = c(120000, 130000)
      yl = c(550000,580000)    
    }
    if(rng=='huge')
    {
      xl = c(30000, 180000)
      yl = c(480000, 650000)
    }
  }else{
    xl = data@bbox[1,]
    yl = data@bbox[2,]
  }
  
  library(raster)
  rast <- raster()
  extent(rast) = c(xl,yl)
  #  projection(rast) = CRS('+init=epsg:28992')
  projection(rast)=NA
  res(rast) = resolution
  
  
  if(spatpix){ rast = suppressWarnings( as(rast, "SpatialPixelsDataFrame") ) }
  
  # the suppresWarnings is used because the warning-function from 'as()'
  # that the raster is empty is unnecessary (it is intended to be empty)
}

# calculates the ideal-free distribution given the interference-free intake rate (IFIR), 
# areas of the patches, the number of birds, using an exponential interference function
# with exponential constant k.
IFD<-function(IFIR.unsorted,areas.unsorted,Nbirds,k){
  ordering=order(IFIR.unsorted,decreasing=T)
  IFIR=IFIR.unsorted[ordering]
  areas=areas.unsorted[ordering]
  #initialize variables
  #note: all intake rates (Wmax,Wtest) are natural logs, i.e. logWmax,logWtest
  Wmax = -Inf; imax = length(IFIR); Wtest = -Inf; i = 0; OccupiedAreaFraction=1
  nom=-k*Nbirds; denom=0
  #find the maximum intake rate Wmax
  while((Wtest > Wmax | i==0) & i <= imax-1 & IFIR[i+1]>0){
    Wmax = Wtest
    i=i+1
    nom=nom+areas[i]*log(IFIR[i])
    denom=denom+areas[i]
    Wtest = nom/denom
  }
  if(Wtest>Wmax) Wmax=Wtest else if(i>0) i=i-1
  #calculate the ideal free distribution (bird densities), given Wmax
  if(Wmax>-Inf){
    distrib=c((log(IFIR[1:i])-Wmax)/k,rep(0,imax-i))
  }
  else{
    # no food available, so distribute all birds evenly
    distrib=rep(0,imax)+Nbirds/sum(areas)
  }
  list(animaldensity=distrib[order(ordering)],intakerate=exp(Wmax))
}

