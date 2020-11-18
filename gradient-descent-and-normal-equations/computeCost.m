% Single Variable Gradient Descent

function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

m = length(y); % number of training examples
estimate = X * theta;
J = sum((estimate - y) .^ 2) / (2 * m);

end



function J_growth = computeCostGrowth(X, y, theta, feature_num)
%COMPUTECOSTGROWTH Compute growth from computeCost function's derivative
%   with specified theta parameters and current feature number

m = length(y);
J_growth = (((X * theta) - y)' * X(:, feature_num)) / m;

end



function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    new_theta = [];
    
    new_theta(1) = theta(1) - (alpha * computeCostGrowth(X, y, theta, 1));
    new_theta(2,1) = theta(2,1) - (alpha * computeCostGrowth(X, y, theta, 2));
    
    theta = new_theta;
    

    new_theta = theta - alpha * 


         
    J_history(iter) = computeCost(X, y, theta);

end

end



function J_growth = computeCostGrowthMulti(X, y, theta)
%COMPUTECOSTGROWTH Compute growth from computeCost function's derivative
%   with specified theta parameters and current feature number

m = length(y);
J_growth = ((X * theta) - y) / m;

end



function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    theta = theta - alpha * X' * computeCostGrowthMulti(X, y, theta);
         
    J_history(iter) = computeCost(X, y, theta);

end



function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

mu = mean(X);
sigma = std(X);
X_norm = (X - mu) ./ sigma;

end

