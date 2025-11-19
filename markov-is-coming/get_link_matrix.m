function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  % TODO: get_link_matrix implementation

  [m, n] = size(Labyrinth);
  Link=get_adjacency_matrix (Labyrinth);


  for i=1:m*n+2
	nr = nnz(Link(i, :));
	if(nr!=0)
	Link(i, :)=Link(i, :)/nr;
	endif
  endfor

end
