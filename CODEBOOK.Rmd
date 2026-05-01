---
title: "CodeBook"
author: "Ivan_Atwiine"
date: "2026-05-01"
output: html_document
---

# CodeBook - Getting and Cleaning Data Course Project

## Source Data
Data collected from accelerometers in Samsung Galaxy S smartphones.
30 volunteers performed 6 activities wearing the smartphone.

## Variables

### Identifiers
- subject: ID of the participant. Integer from 1 to 30
- activity: Activity performed. One of:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

### Measurements
All measurement values are averages per subject per activity.

- TimeBodyAccelerometerMeanX: mean body acceleration X axis (time domain)
- TimeBodyAccelerometerMeanY: mean body acceleration Y axis (time domain)
- TimeBodyAccelerometerMeanZ: mean body acceleration Z axis (time domain)
- TimeBodyAccelerometerSTDX: std body acceleration X axis (time domain)
- TimeBodyAccelerometerSTDY: std body acceleration Y axis (time domain)
- TimeBodyAccelerometerSTDZ: std body acceleration Z axis (time domain)
... and so on for all 66 measurement columns

## Transformations Applied
1. Training and test sets merged into one dataset
2. Only mean and std measurements extracted
3. Activity codes replaced with descriptive names
4. Variable names expanded to be descriptive
5. Final tidy dataset created with averages per subject per activity
