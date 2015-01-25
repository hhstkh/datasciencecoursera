## **How to run this script:**
1. Copy script to working directory
2. Download and unzip data to working directory
3. Load script file: source("run_analysis.R")
4. Type :runAnalysis(), export final.txt file result
**How script work**
1. Read features.txt
2. Find element contain mean or std
3. Read train data into one dataset: X_train.txt, y_train.txt, subject_train.txt
4. Read test data int one dataset: X_test.txt, y_test.txt, subject_test.txt
5. Merge dataset step 3 and step 4 into one dataset
6. Read activity from activity_labels.txt
7. Merge dataset of step 5 and step 6 into one dataset
8. Use aggregate to get result