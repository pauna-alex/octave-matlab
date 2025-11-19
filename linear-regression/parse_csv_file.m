function [Y, InitialMatrix] = parse_csv_file(file_path)
 % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation

  file = fopen(file_path, 'r');
  
  fgetl(file);

  format = '%f %f %d %d %d %s %s %s %s %s %d %s %s';

  data = textscan(file, format, 'Delimiter', ',');

  fclose(file);

  Y = data{1};
  InitialMatrix = [num2cell(data{2}), num2cell(data{3}), num2cell(data{4}), num2cell(data{5}), ...
                   data{6}, data{7}, data{8}, data{9}, data{10}, num2cell(data{11}), ...
                   data{12}, data{13}];

end