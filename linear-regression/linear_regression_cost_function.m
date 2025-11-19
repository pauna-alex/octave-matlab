function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation

  [m,n] = size(FeatureMatrix);
  FM(1:m,2:n+1) = FeatureMatrix;
  FM(:,1) = 1;
  Error = (1 / (2 * m)) * sum((FM * Theta - Y) .^2);
end
