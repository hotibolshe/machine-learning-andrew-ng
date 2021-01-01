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
h = X * theta; % h - for hypothesis, estimate;
e = h - y; % e - for error;

J_growth = (e' * X(:, feature_num)) / m;

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
    

    J_history(iter) = computeCost(X, y, theta);

end

end



function J_growth = computeCostGrowthMulti(X, y, theta)
%COMPUTECOSTGROWTHMULTI Compute growth from computeCost function's derivative
%   with specified theta parameters but without multiplying by features variable
%   as it'll be multiplied by matrix of them (X) and assigned to all thetas
%   accordingly

m = length(y);
h = X * theta; 
e = h - y; 

J_growth = e / m;

end



function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    theta = theta - alpha * X' * computeCostGrowthMulti(X, y, theta);
         
    J_history(iter) = computeCost(X, y, theta);

end



