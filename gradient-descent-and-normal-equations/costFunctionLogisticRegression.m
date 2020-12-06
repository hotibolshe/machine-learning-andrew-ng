function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

m = length(y); 
h = sigmoid(X * theta);
pos = -y .* log(h);
neg = -(ones(m, 1) - y) .* log(1 - h);

J = 1 / m * sum(pos + neg);

error = h - y;

grad = (X' * error) / m;


end

