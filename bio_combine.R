library(tidyverse)
#library(dplyr)
#library(foreign) 								#���ض�ȡdbf�ļ��İ�


#����spec_dist.csv���ֲַ��ص�����
spec_dist <- readr::read_csv('D:/CSIS/CSIS_csv/spec_dist.csv') 
spec_dist

#����loca_deta.csv��������
loca_deta <- readr::read_csv('D:/CSIS/CSIS_csv/loca_deta.csv') 
loca_deta <- tibble::as_tibble(loca_deta)
loca_deta_s <- loca_deta %>% dplyr::select(LOC_CODE,YVAL,XVAL)
loca_deta_s


#����SPEC_POPU2.txt������Ⱥ����
SPEC_POPU <- readr::read_csv('D:/CSIS/CSIS_excel/SPEC_POPU2.txt') 
SPEC_POPU <- tibble::as_tibble(SPEC_POPU)
SPEC_POPU_s <- SPEC_POPU %>% select(csp_code,loc_code,altitude,habitat)
SPEC_POPU_s


#����SPEC_POPU2.txt��loca_deta.csv����
SPEC_POPU_deta <- inner_join(SPEC_POPU_s, loca_deta_s, by = c("loc_code" = "LOC_CODE"))
SPEC_POPU_deta