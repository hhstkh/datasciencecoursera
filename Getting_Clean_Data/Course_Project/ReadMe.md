## **How to run this script:**
1. Copy script to working directory
2. Download and unzip data to working directory
3. Load script file: source("run_analysis.R")
4. Type :runAnalysis(), export final.txt file result</br>
**How script work**
 Read features.txt
 Find element contain mean or std
 Read train data into one dataset: X_train.txt, y_train.txt, subject_train.txt
 Read test data int one dataset: X_test.txt, y_test.txt, subject_test.txt
 Merge dataset step 3 and step 4 into one dataset
 Read activity from activity_labels.txt
 Merge dataset of step 5 and step 6 into one dataset
 Use aggregate to get result