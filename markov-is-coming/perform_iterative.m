function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations

	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

	 % TODO: perform_iterative implementation

	 x=x0;
	 i=1;

	 while i<max_steps

		 x_prev=x;
		 x=G*x+c;

		 if norm(x-x_prev)<tol
			 break
		 endif
		 
		 i=i+1;

	 endwhile


	 steps=i;
	 err = norm(x - x_prev);

end
