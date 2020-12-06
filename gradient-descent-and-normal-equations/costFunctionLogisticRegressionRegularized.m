function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
h = sigmoid(X * theta);
pos = -y .* log(h);
neg = -(ones(m, 1) - y) .* log(1 - h);
except_first_theta = theta;
except_first_theta(1) = 0; % Add up all but first parameter
reg = lambda / (2* m) * sum(except_first_theta .^ 2);

J = 1 / m * sum(pos + neg) + reg;

error = h - y;
except_first_ones = ones(length(theta), 1);
except_first_ones(1) = 0; % Regularize all but first '1' parameter

grad = (X' * error) / m + theta .* (except_first_ones * lambda / m);

end

