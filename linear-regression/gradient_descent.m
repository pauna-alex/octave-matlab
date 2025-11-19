function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation


    Theta = zeros(n+1, 1);

   
    FM = zeros(m, n+1);
    FM(:, 2:n+1) = FeatureMatrix; 
    FM(:, 1) = 1;


    for k = 1:iter
        
        x = FM * Theta;
        
        z = x - Y;
        
        gradient = (1/m) * (FM' * z);
        
        Theta = Theta - alpha * gradient;
    endfor
    Theta(1)=Theta(1)-Theta(1);
end