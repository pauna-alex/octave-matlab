function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  % TODO: normal_equation implementation

    [m, n] = size(FeatureMatrix);
    
    FM = zeros(m, n+1);  
    FM(:, 2:n+1) = FeatureMatrix;
    FM(:, 1) = 0;

    A = FM' * FM;
    b = FM' * Y;


    Theta = zeros(n+1, 1);

   
    r = b - A * Theta; 
    v = r; 
    x = Theta;
    tol2 = tol^2;
    k = 1;

    while k <= iter && (r' * r) > tol2

        t_k = (r' * r) / (v' * A * v);

        x = x + t_k * v;

        r_new = r - t_k * A * v;
        
        s_k = (r_new' * r_new) / (r' * r);

        v = r_new + s_k * v;
        
        r = r_new;

        k = k + 1;
    endwhile

    Theta = x;
end