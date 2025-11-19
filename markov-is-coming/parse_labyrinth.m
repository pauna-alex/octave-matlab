function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  
  % TODO: parse_labyrinth implementation

  file = fopen(file_path, 'r');
  
  demension = fscanf(file, '%d %d', 2);
  m=demension(1);
  n=demension(2);

  Labyrinth = zeros(m, n);

   for i = 1:m
		for j = 1:n
			Labyrinth(i, j) = fscanf(file, '%d', 1);
		end
	end

  fclose(file);

end
