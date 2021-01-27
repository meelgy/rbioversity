
library(raster)
library(ncdf4)
library(rasterVis)
library(lattice)

##��ȡ��������ʱ������nc����
ncfile<-nc_open("E:/1data/tmn_2015_2017.nc")
names(ncfile$var)

input_nc = 'E:/1data/tmn_2015_2017.nc'
varname = 'tmn'
##ѹ����դ��ջ
raster1 = stack(input_nc, varname = varname)


outpath<-"E:/1data/���������"
##Ϊ�ļ���������׼��
x1<-c(1:12)
x2<-paste("2015",x1,sep = "")
x3<-paste("2016",x1,sep = "")
x4<-paste("2017",x1,sep = "")
x5<-c(x2,x3,x4)
out_filename<-sapply(x5, function(x)paste(x,".tif",sep = ""))      #���tif��ʽ
out_path<-sapply(out_filename, function(x){
  paste(outpath,x,sep = "/")})                #���·����

for(i in 1:36){
  writeRaster(raster1[[i]],out_path[i], format = 'GTiff', overwrite = TRUE)
}
