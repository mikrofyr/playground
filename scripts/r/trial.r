print("Hello")


#data <- read.csv(file="full.csv", header=TRUE, sep=",")
data <- read.csv(file="sample.csv", header=TRUE, sep=",")
data <- data[,-1]
# -- With zero values
print("Zeros included ...")
print(colMeans(data))
png(filename="./box_0.png", width=1024,height=720)
#boxplot(data)
boxplot(data,data=ToothGrowth)
dev.off()

# -- Conver zeros to NA
print("Zero filtered")
is.na(data) <- data==0
print(colMeans(data, na.rm="True"))
png(filename="./box_na.png", width=1024,height=720)
#boxplot(data)
boxplot(data,data=ToothGrowth)
dev.off()

# -- Doodle
#nzmean <- function(x){
#  if (all(x==0)) 0 else colMeans(x[x!=0])
#}
#apply(data,nzmean)
#print(data)
#print("----------------------")
#print(data)
#boxplot(data)
#print("----------------------")
#print(data)
#print(filtered[,1])
# Save to png
#png(filename="./filtered.png")
#res <- boxplot(data)
#dev.off
#dev.new()
#dev.copy(jpeg,filename="test1.jpg")
#dev.print("test.png")
# Problems with background for png
#dev.copy(png,filename="test.png",bg="white")
#png(filename="filtered.png",boxplot(data))
#dev.off



