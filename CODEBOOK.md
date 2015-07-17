### Original data:

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#### The dataset includes the following files:

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Variables

The following input variables are used in the script:
* 'testData': Used to store the Test Set
* 'testLabels': Used to store the Test Labels
* 'testData_sub': Used to store the Test Data Subject
* 'trainData': Used to store the Training Set
* 'trainLabels': Used to store the Training Labels
* 'trainData_sub': Used to store the Training Data Subject
* 'activities': Used to store the linkage of the class labels with their activity name

### Data Transformation Steps
* Load test and training set and activity data from source dataset using `read.table` library
* Apply descriptive activity names from `activity_labels.txt` to name the acitivites in the `testData_act` and `trainData_act` data frames
* Label the data set with descriptive activity names from `features.txt` as column names for each dataframe
* Merge test and training data sets into a single data set in the `bigData` dataframe
* `sapply()` is used to generate mean and standard deviation values using the `mean()` and `sd()` function
* Generate single output file `tidy_data_set.txt` using `write.table` function

