function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation

    [m, n] = size(FeatureMatrix);

    FM = zeros(m, n+1);
    FM(:, 2:n+1) = FeatureMatrix;
    FM(:, 1) = 1;

    x = FM * Theta;
    
    z = Y - x;
    
    term1 = (1/m) * sum(z .^ 2);

  
    term2 = lambda * sum(abs(Theta));

    Error = term1 + term2;
end