library(tidyverse)
#library(dplyr)
#library(foreign) 								#加载读取dbf文件的包


#导入spec_dist.csv物种分布地点数据
spec_dist <- readr::read_csv('D:/CSIS/CSIS_csv/spec_dist.csv') 
spec_dist

#导入loca_deta.csv地名数据
loca_deta <- readr::read_csv('D:/CSIS/CSIS_csv/loca_deta.csv') 
loca_deta <- tibble::as_tibble(loca_deta)
loca_deta_s <- loca_deta %>% dplyr::select(LOC_CODE,YVAL,XVAL)
loca_deta_s


#导入SPEC_POPU2.txt物种种群数据
SPEC_POPU <- readr::read_csv('D:/CSIS/CSIS_excel/SPEC_POPU2.txt') 
SPEC_POPU <- tibble::as_tibble(SPEC_POPU)
SPEC_POPU_s <- SPEC_POPU %>% select(csp_code,loc_code,altitude,habitat)
SPEC_POPU_s


#链接SPEC_POPU2.txt与loca_deta.csv数据
SPEC_POPU_deta <- inner_join(SPEC_POPU_s, loca_deta_s, by = c("loc_code" = "LOC_CODE"))
SPEC_POPU_deta
