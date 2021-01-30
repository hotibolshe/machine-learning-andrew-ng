# Skewed datasets
## Is when some classes has dramatically lower proportion to the others.

## Given results table:
* Samples m = 1000
* y = 1 - *positive* cancer (more rare case always 1)
* y = 0 - *negative* cancer 


                    Actual Class: 1 | Actual Class: 0
Predicted Class: 1        10                9
Predicted Class: 0        5                 976

So in total actuals: y=1: 15, y=0: 986 -> just 1.5% of whole dataset are cancer labeled.

*True Positive - Predicted & Actual y = 1*  
*False Positive - Predicted y = 1, Actual y = 0*  
*True Negative - Predicted & Actual y = 0*  
*False Negative - Predicted y = 0, Actual y = 1*  

# **Accuracy** = (True Positives + True Negatives) / Total examples
In that case - 10 + 976 / 1000 = 98.6% - Quite high, huh!

# **Precision** - how many of cancer predictions actually have it
### The share of true positive among all positive predictions
## True Positive / (True Positives + False Positives)
10 / (10 + 9) = 0.52 (9 cancer positive are falsy predicted of 19 total -> 50% chance if you get cancer result - it's false)

# **Recall** - how many of all actual positive cancers are predicted
## True Positive / (True Positives + False Negatives)
10 / (10 + 5) = 0.66 (10 cancer positive are predicted of actual 15 cases. If you have cancer - there's only 66% change you'll get correct positive result. Quite poor performance)

## Why accuracy is so high? Because most of dataset is negative data. And precision & recall for negative predictions will be quite good.

# Recall / Precision tradeoff.
## To make a tradeoff we can increase dataset size by adding more samples of rare case. Also we can correct the threshold of coefficient which says when to consider is it class A or B (e.g `h >= 0.5 -> h = 1; h < 0.5 -> h = 0`)

# F score
## To find best threshold there's a meaure cold F score (or F subscript 1 score)
## F score = (2 * precision * recall) / (precision + recall)
### If precision or recall == 0 or quite small -> F score will also be quite small
### Else if precision and recall == 1 or big -> F score will be high


# Threshold knobing
## Increasing threshold -> call positive only if very confident -> decrease of true positive (increase of *precision* -> increase of false negative (decrease of *recall*)
## Decreasing threshold -> call more positives (decrease the chance of missing positive) -> decrease of false negatives (increase of *recall*) -> increase of true positives (decrease of *precision*)



