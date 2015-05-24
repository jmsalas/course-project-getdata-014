# Dataset code book
This document describes the data contained in the `result_dataset.txt` file.

## Overview of the source of the data
The original data used in this project was extracted from the ["Human Activity Recognition Using Smartphones Dataset - Version 1.0"][1]. This dataset contains the results of an experiment carried out to capture different motion data, which was organized to be used with machine learning algorithms.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.
Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.

## Data dictionary

### Naming conventions used for variables
The naming convention used for the variables can be broken down into the following aspects, separated by `_` when reading each label:
- `time` or `frequency` to indicate time domain or frequency domain respectively.
- `body` or `gravity` to represent if the acceleration belongs to the device itself, or to the force of gravity.
- `acceleration` or `angular_velocity` to represent data read from the accelerometer or the gyroscope of the device, respectively.
- `mean`, `std` or `mean_frequency` to indicate if the value represents a mean, standard deviation or a mean frequency, respectivey.
- `X`, `Y` or `Z` indicating if the value was measured along a specific axis on the 3-dimesional space.

### Other considerations
- All numeric features are normalized and bounded within [-1,1].

### Variable definitions

#### Subject
Numeric value, indicating to which of the 30 subjects in the experiment the measurment belongs.

#### Activity
Name of the activity the subject was performing when the measurment was taken:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

#### time_body_acceleration_mean_X
Body acceleration mean along the X axis. Normalized to [-1,1].

#### time_body_acceleration_mean_Y
Body acceleration mean along the Y axis. Normalized to [-1,1].

#### time_body_acceleration_mean_Z
Body acceleration mean along the Z axis. Normalized to [-1,1].

#### time_body_acceleration_std_X
Body acceleration standard deviation along the X axis. Normalized to [-1,1].

#### time_body_acceleration_std_Y
Body acceleration standard deviation along the Y axis. Normalized to [-1,1].

#### time_body_acceleration_std_Z
Body acceleration standard deviation along the Z axis. Normalized to [-1,1].

#### time_gravity_acceleration_mean_X
Gravity acceleration mean along the X axis. Normalized to [-1,1].

#### time_gravity_acceleration_mean_Y
Gravity acceleration mean along the Y axis. Normalized to [-1,1].

#### time_gravity_acceleration_mean_Z
Gravity acceleration mean along the Z axis. Normalized to [-1,1].

#### time_gravity_acceleration_std_X
Gravity acceleration standard deviation along the X axis. Normalized to [-1,1].

#### time_gravity_acceleration_std_Y
Gravity acceleration standard deviation along the Y axis. Normalized to [-1,1].

#### time_gravity_acceleration_std_Z
Gravity acceleration standard deviation along the Z axis. Normalized to [-1,1].

#### time_body_acceleration_jerk_mean_X
Body acceleration jerk mean along the X axis. Normalized to [-1,1].

#### time_body_acceleration_jerk_mean_Y
Body acceleration jerk mean along the Y axis. Normalized to [-1,1].

#### time_body_acceleration_jerk_mean_Z
Body acceleration jerk mean along the Z axis. Normalized to [-1,1].

#### time_body_acceleration_jerk_std_X
Body acceleration jerk standard deviation along the X axis. Normalized to [-1,1].

#### time_body_acceleration_jerk_std_Y
Body acceleration jerk standard deviation along the Y axis. Normalized to [-1,1].

#### time_body_acceleration_jerk_std_Z
Body acceleration jerk standard deviation along the Z axis. Normalized to [-1,1].

#### time_body_angular_velocity_mean_X
Body angular velocity mean along the X axis. Normalized to [-1,1].

#### time_body_angular_velocity_mean_Y
Body angular velocity mean along the Y axis. Normalized to [-1,1].

#### time_body_angular_velocity_mean_Z
Body angular velocity mean along the Z axis. Normalized to [-1,1].

#### time_body_angular_velocity_std_X
Body angular velocity standard deviation along the X axis. Normalized to [-1,1].

#### time_body_angular_velocity_std_Y
Body angular velocity standard deviation along the Y axis. Normalized to [-1,1].

#### time_body_angular_velocity_std_Z
Body angular velocity standard deviation along the Z axis. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_mean_X
Body angular velocity jerk mean along the X axis. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_mean_Y
Body angular velocity jerk mean along the Y axis. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_mean_Z
Body angular velocity jerk mean along the Z axis. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_std_X
Body angular velocity jerk standard deviation along the X axis. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_std_Y
Body angular velocity jerk standard deviation along the Y axis. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_std_Z
Body angular velocity jerk standard deviation along the Z axis. Normalized to [-1,1].

#### time_body_acceleration_magnitude_mean
Body acceleration magnitude mean. Normalized to [-1,1].

#### time_body_acceleration_magnitude_std
Body acceleration magnitude standard deviation. Normalized to [-1,1].

#### time_gravity_acceleration_magnitude_mean
Gravity acceleration magnitude mean. Normalized to [-1,1].

#### time_gravity_acceleration_magnitude_std
Gravity acceleration magnitude standard deviation. Normalized to [-1,1].

#### time_body_acceleration_jerk_magnitude_mean
Body acceleration jerk magnitude mean. Normalized to [-1,1].

#### time_body_acceleration_jerk_magnitude_std
Body acceleration jerk magnitude standard deviation. Normalized to [-1,1].

#### time_body_angular_velocity_magnitude_mean
Body angular velocity magnitude mean. Normalized to [-1,1].

#### time_body_angular_velocity_magnitude_std
Body angular velocity magnitude standard deviation. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_magnitude_mean
Body angular velocity jerk magnitude mean. Normalized to [-1,1].

#### time_body_angular_velocity_jerk_magnitude_std
Body angular velocity jerk magnitude standard deviation. Normalized to [-1,1].

#### frequency_body_acceleration_mean_X
Frequency domain body acceleration mean along the X axis. Normalized to [-1,1].

#### frequency_body_acceleration_mean_Y
Frequency domain body acceleration mean along the Y axis. Normalized to [-1,1].

#### frequency_body_acceleration_mean_Z
Frequency domain body acceleration mean along the Z axis. Normalized to [-1,1].

#### frequency_body_acceleration_std_X
Frequency domain body acceleration standard deviation along the X axis. Normalized to [-1,1].

#### frequency_body_acceleration_std_Y
Frequency domain body acceleration standard deviation along the Y axis. Normalized to [-1,1].

#### frequency_body_acceleration_std_Z
Frequency domain body acceleration standard deviation along the Z axis. Normalized to [-1,1].

#### frequency_body_acceleration_mean_frequency_X
Frequency domain body acceleration mean frequency along the X axis. Normalized to [-1,1].

#### frequency_body_acceleration_mean_frequency_Y
Frequency domain body acceleration mean frequency along the Y axis. Normalized to [-1,1].

#### frequency_body_acceleration_mean_frequency_Z
Frequency domain body acceleration mean frequency along the Z axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_mean_X
Frequency domain body acceleration jerk mean along the X axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_mean_Y
Frequency domain body acceleration jerk mean along the Y axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_mean_Z
Frequency domain body acceleration jerk mean along the Z axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_std_X
Frequency domain body acceleration jerk standard deviation along the X axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_std_Y
Frequency domain body acceleration jerk standard deviation along the Y axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_std_Z
Frequency domain body acceleration jerk standard deviation along the Z axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_mean_frequency_X
Frequency domain body acceleration jerk mean frequency along the X axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_mean_frequency_Y
Frequency domain body acceleration jerk mean frequency along the Y axis. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_mean_frequency_Z
Frequency domain body acceleration jerk mean frequency along the Z axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_mean_X
Frequency domain body angular velocity mean along the X axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_mean_Y
Frequency domain body angular velocity mean along the Y axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_mean_Z
Frequency domain body angular velocity mean along the Z axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_std_X
Frequency domain body angular velocity standard deviation along the X axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_std_Y
Frequency domain body angular velocity standard deviation along the Y axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_std_Z
Frequency domain body angular velocity standard deviation along the Z axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_mean_frequency_X
Frequency domain body angular velocity mean frequency along the X axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_mean_frequency_Y
Frequency domain body angular velocity mean frequency along the Y axis. Normalized to [-1,1].

#### frequency_body_angular_velocity_mean_frequency_Z
Frequency domain body angular velocity mean frequency along the Z axis. Normalized to [-1,1].

#### frequency_body_acceleration_magnitude_mean
Frequency domain body acceleration magnitude mean. Normalized to [-1,1].

#### frequency_body_acceleration_magnitude_std
Frequency domain body acceleration magnitude standard deviation. Normalized to [-1,1].

#### frequency_body_acceleration_magnitude_mean_frequency
Frequency domain body acceleration magnitude mean frequency. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_magnitude_mean
Frequency domain body acceleration jerk magnitude mean. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_magnitude_std
Frequency domain body acceleration jerk magnitude standard deviation. Normalized to [-1,1].

#### frequency_body_acceleration_jerk_magnitude_mean_frequency
Frequency domain body acceleration jerk magnitude mean frequency. Normalized to [-1,1].

#### frequency_body_angular_velocity_magnitude_mean
Frequency domain body angular velocity magnitude mean. Normalized to [-1,1].

#### frequency_body_angular_velocity_magnitude_std
Frequency domain body angular velocity magnitude standard deviation. Normalized to [-1,1].

#### frequency_body_angular_velocity_magnitude_mean_frequency
Frequency domain body angular velocity magnitude mean frequency. Normalized to [-1,1].

#### frequency_body_angular_velocity_jerk_magnitude_mean
Frequency domain body angular velocity jerk magnitude mean. Normalized to [-1,1].

#### frequency_body_angular_velocity_jerk_magnitude_std
Frequency domain body angular velocity magnitude standard deviation. Normalized to [-1,1].

#### frequency_body_angular_velocity_jerk_magnitude_mean_frequency
Frequency domain body angular velocity magnitude mean frequency. Normalized to [-1,1].


[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip