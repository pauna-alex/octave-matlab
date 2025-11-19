function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  % TODO: prepare_for_regression implementation

    [m, n] = size(InitialMatrix);

    FeatureMatrix = zeros(m, n + 1);

    for i = 1:m
        copy_n = 1; 
        for j = 1:n
            x = InitialMatrix{i, j};
            if isnumeric(x)
                FeatureMatrix(i, copy_n) = x;
                copy_n = copy_n + 1;
            else
                if strcmpi(x, 'yes')
                    FeatureMatrix(i, copy_n) = 1;
                    copy_n = copy_n + 1;
                elseif strcmpi(x, 'no')
                    FeatureMatrix(i, copy_n) = 0;
                    copy_n = copy_n + 1;
                elseif strcmpi(x, 'semi-furnished')
                    FeatureMatrix(i, copy_n) = 1; 
                    FeatureMatrix(i, copy_n + 1) = 0;
                    copy_n = copy_n + 2;
                elseif strcmpi(x, 'unfurnished')
                    FeatureMatrix(i, copy_n) = 0;
                    FeatureMatrix(i, copy_n + 1) = 1;
                    copy_n = copy_n + 2;
                elseif strcmpi(x, 'furnished')
                    FeatureMatrix(i, copy_n) = 0;
                    FeatureMatrix(i, copy_n + 1) = 0;
                    copy_n = copy_n + 2;
                endif
            endif
        endfor
    endfor
end