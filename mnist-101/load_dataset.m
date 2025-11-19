function [X, y] = load_dataset(path)
  % path -> calea relativă către fișierul .mat în format Octave text
  % X, y -> exemplele de antrenare și etichetele lor corespunzătoare

  file = fopen(path, 'r');
  
  fgetl(file);
  fgetl(file);
  fgetl(file);
  linie = fgetl(file);
  m = str2double(strtrim(strrep(linie, '# rows:', '')));
  linie = fgetl(file);
  n = str2double(strtrim(strrep(linie, '# columns:', '')));

  X = zeros(m, n);
  for i = 1:m
    linie = fgetl(file);
    X(i, :) = sscanf(linie, '%f')';
  endfor

  fgetl(file);
  fgetl(file);

  fgetl(file);
  fgetl(file);
  linie = fgetl(file);
  my = str2double(strtrim(strrep(linie, '# rows:', '')));


  fgetl(file);

  y = zeros(my, 1);
  for i = 1:my
    linie = fgetl(file);
    y(i) = sscanf(linie, '%f');
  endfor

  fclose(file);
end
