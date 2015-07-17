library(data.table)

# Load test data and subject into variables
testData <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
testData_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

# Load training data and subject into variables
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
trainData_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

# Name activities using activity labels for the test and training data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
testLabels$V1 <- factor(testLabels$V1,levels=activities$V1,labels=activities$V2)
trainLabels$V1 <- factor(trainLabels$V1,levels=activities$V1,labels=activities$V2)

# Appropriately labels the data set with descriptive activity names
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
colnames(testData)<-features$V2
colnames(trainData)<-features$V2
colnames(testLabels)<-c("Activity")
colnames(trainLabels)<-c("Activity")
colnames(testData_sub)<-c("Subject")
colnames(trainData_sub)<-c("Subject")

# Merge test and training sets into one data set, including the activities
testData<-cbind(testData,testLabels)
testData<-cbind(testData,testData_sub)
trainData<-cbind(trainData,trainLabels)
trainData<-cbind(trainData,trainData_sub)
bigData<-rbind(testData,trainData)

# Calculate mean and standard deviation
bigData_mean<-sapply(bigData,mean,na.rm=TRUE)
bigData_sd<-sapply(bigData,sd,na.rm=TRUE)

# Create tidy output as text file using write.table
DT <- data.table(bigData)
tidy<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy_data_set.txt",sep=",",row.names = FALSE)