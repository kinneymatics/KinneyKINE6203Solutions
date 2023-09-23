function compClick = computerMove(playedBoard)
%computerMove - This function simulates a computer move on the tic tac toe
% game board AFTER the first move has been made. computerMove takes the
% current status of the tic tac toe board as input, locates empty positions
% on the board, generates two random integers (a row & column index of a
% 3x3 matrix (i.e., a tic tac toe board), and stores that move as a 1x2
% vector. 

pause(1)     % Pause for 1 second to simulate computer "thinking"
[row,col] = find(playedBoard == 0);  % Find empty positions on the current TTT board
compSelection = randi(length(row));     % Generate a random index within the range of available empty positions
compRowSelection = row(compSelection);     % Select the row for the computer's move based on the random index
compColSelection = col(compSelection);  % Select the row for the computer's move based on the random index
compClick = [compRowSelection,compColSelection];     % Store the computer's selected move as a 1x2 row vector
end