function [Adj] = get_adjacency_matrix (Labyrinth)
    % Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % TODO: get_adjacency_matrix implementation

   [m, n] = size(Labyrinth);
    Adj = zeros(m * n + 2, m * n + 2);

    win = m * n + 1;
    lose = m * n + 2;

    Adj(win, win) = 1;
    Adj(lose, lose) = 1;

    for i = 1:m
        for j = 1:n
            poz = (i-1) * n + j;
            bin = dec2bin(Labyrinth(i,j), 4);

            if bin(1) == '0'
                if i == 1
                    Adj(poz, win) = 1;
                else
                    Adj(poz, poz - n) = 1;
                    Adj(poz - n, poz) = 1;
                endif
            endif

            if bin(2) == '0'
                if i == m
                    Adj(poz, win) = 1;
                else
                    Adj(poz, poz + n) = 1;
                    Adj(poz + n, poz) = 1;
                endif
            endif

            if bin(3) == '0'
                if j == n
                    Adj(poz, lose) = 1;
                else
                    Adj(poz, poz + 1) = 1;
                    Adj(poz + 1, poz) = 1;
                endif
            endif

            if bin(4) == '0'
                if j == 1
                    Adj(poz, lose) = 1;
                else
                    Adj(poz, poz - 1) = 1;
                    Adj(poz - 1, poz) = 1;
                endif
            endif

        endfor
    endfor
  
end

