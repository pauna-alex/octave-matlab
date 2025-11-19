function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)

	% G -> iteration matrix
	% c -> iteration vector

	% TODO: get_Jacobi_parameters
	
	[m,n]=size(Link);

	G=Link(1:m-2,1:n-2);
	c=Link(1:m-2,n-1);

end
