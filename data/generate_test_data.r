# generate some test data for a merge
d1 = data.frame(PatientID=c("P000"), PatientName=c("P000"), StudyDate=as.Date("20190101","%Y%m%d"), Vol_Hippocampus=c(5200), Vol_Amygdala=c(1000))
num = 500
for (i in 1:num) {
  date = sample(seq(as.Date('1999/01/01'), as.Date('2019/01/01'), by="day"), 1)
  r = data.frame(PatientID=c(sprintf("P%03d", i)), PatientName=c(sprintf("P%03d", i)), StudyDate=date, Vol_Hippocampus=c(5000*runif(1)), Vol_Amygdala=c(100000*runif(1)))
  d1 <- rbind(d1, r)
}

# generate some test data for a merge
d2 = d1
d2$intra_cranial_volume = d2$Vol_Hippocampus*23
d2$Vol_Amygdala_l = d2$Vol_Amygdala/2
d2$Vol_Hippocampus = NULL
d2$Vol_Amygdala = NULL
# remove some rows
d2 = d2[-seq(100,200),]

write.csv(d1, 'd1.csv',row.names=F)
write.csv(d2, 'd2.csv',row.names=F)
