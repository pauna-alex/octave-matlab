function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

decoded_path = [];
i = 1;

while i < length(path)
	c = mod(path(i)-1, cols) + 1;
	l = floor((path(i) - 1) / cols) + 1;
	decoded_path = [decoded_path; l, c];
	i = i + 1;
endwhile

end


