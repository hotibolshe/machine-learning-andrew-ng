Model selection, aka knobs to turn:
* Training dataset
* Size of features
* Amount of polynomial
* Regularization lambda 


Steps to learn: 

Option 1:
1. Separate dataset on train and test (70/30)
2. Tune parameters, find best result for train set.
3. Check those parameters on test set.
4. Repeat from step 2.
Problem: results will best fit for that test dataset.
Solution: create additional cross-validation (or just validation) test.

Option 2:
1. Separate dataset on train, validation and test (60/20/20)
2. Tune parameters, find best result for train set.
3. Check those parameters on validation set.
4. Repeat from step 2.
5. Find generalization error with test set, using those parameters.


Bias vs Variance problem
High Bias - straight line, underfitting
High Variance - crazy-poynomial curve, overfitting

When test or cross-validation (cv) errors are high - high bias or variance problem?
1. Is J-train (cost or error of train set) big? 
Yes: Underfitting, high bias (also J-cv will look almost like J-train).
No: Overfitting, high variance. J-cv much higher than J-train.

![bias vs variance](bias-vs-variance.png)


Dataset sizes and bias/variance
Correlations of size and high bias:
Both big errors at low size, and also big errors and more size (very similiar J-cv and J-train)
In that case increasing size of dataset won't help in any way

Correlations of size and high variance:
Both big errors at low size.
Good J-train and big error for J-cv for big size. Also that difference remains static.




High variance? 
Get more train samples
Decrease set of features
Increase lambda

High bias?
Get more features
Get more poynomials
Decrease lambda


Number of units = number of features
Number of units and layers = number of features and polynomials




Example:
Suppose you have implemented regularized logistic regression to classify what object is in an image (i.e., to do object recognition). However, when you test your hypothesis on a new set of images, you find that it makes unacceptably large errors with its predictions on the new images.  However, your hypothesis performs well (has low error) on the training set.

J-train > J-cv
That means overfitting, or high variance
[x] Try adding polynomial features - only increase overfitting
[+] Use fewer training examples - may help
[+] Try using a smaller set of features
[x] Get moe training examples







