function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation


    [m, n] = size(FeMatrix);
    FM = zeros(m, n+1);
    FM(:, 2:n+1) = FeMatrix;
    FM(:, 1) = 1;
    X = FM * Theta;
    Z = X - Y;
    term1 = (1/(2*m)) * sum(Z .^ 2);
    term2 = lambda * sum(Theta(2:end) .^ 2);
    Error = term1 + term2;
    
end