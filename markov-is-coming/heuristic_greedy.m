function [path] = heuristic_greedy(start_position, probabilities, Adj)
    % start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
    % TODO: heuristic_greedy implementation


    path = start_position;
    visited = zeros(1, length(probabilities));
    visited(1:length(probabilities)) = false;
    visited(start_position) = true;


    while ~isempty(path)
        position = path(end);

        if position == length(probabilities) - 1
            break;
        endif

        
        neighbors = find(Adj(position, :) == 1 & ~visited);

        if isempty(neighbors)
            path(end) = [];
        else
            [~, idx] = max(probabilities(neighbors));
            neigh = neighbors(idx);

            visited(neigh) = true;
            path = [path, neigh];
        endif
    endwhile
end
