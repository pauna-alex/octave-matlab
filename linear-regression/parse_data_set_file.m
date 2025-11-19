function [Y, InitialMatrix] = parse_data_set_file(file_path)
  
    % path -> a relative path to the .txt file

    % Y -> the vector with all actual values
    % InitialMatrix -> the matrix that must be transformed
  
     % TODO: parse_data_set_file implementation

    file = fopen(file_path, 'r');

    dimensions = fscanf(file, '%d %d', 2);
    m = dimensions(1);
    n = dimensions(2);


    Y = zeros(m, 1);
    InitialMatrix = cell(m, n);

    fgetl(file);

    for i = 1:m
        line = fgetl(file);
        prop = strsplit(strtrim(line));
        Y(i) = str2double(prop{1});
        for j = 1:n
            word = prop{j + 1};
            nr = str2double(word);
            if isnan(nr)
                InitialMatrix{i, j} = word;  
            else
                InitialMatrix{i, j} = nr;
            endif
        endfor
    endfor
    
    fclose(file);
end