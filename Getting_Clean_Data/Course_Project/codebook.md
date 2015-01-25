
##**Data Dictionary**##
subject - Volunteer
		Range value from 1 to 30
description - activities are perform by volunteers
			They are six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
other columns -  the average of it for each activity and each subject
				These columns come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
				which are selected from columns contain mean or std of X_train.txt and X_test.txt
				tAcc-XYZ is acceleration signal which as then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
				the body linear acceleration and angular velocity were derived in time to 
				obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)
				the magnitude of these three-dimensional signals were calculated 
                using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)
				prefix 't': These time domain signals were captured at a constant rate of 50 Hz.
				fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag
				are produced by applying Fast Fourier Transform (FFT) for above signals
				prefix 'f': frequency domain signals
	
	
				