function [gameOver,WINNER] = winConditions(playedBoard)
% winConditions - This function takes the current status of the tic tac toe
% board as input and runs through multiple "checkpoints" to detemine if a
% win condition has been satisfied. There are 4 winConditions in this
% script - a row-based win, a column-based win, a left-to-right diagonal
% win, or a right-to-left diagonal win.

gameOver = 'no'; % initialize gameOver variable
WINNER = []; % initialize WINNER variable

checkROWS = sum(playedBoard, 2)';     % Sum the elements in each row and convert it to a row vector
checkCOLS = sum(playedBoard,1);     % Sum the elements in each column and return a row vector
checkDIAGONAL_LR = playedBoard(1,1) + playedBoard(2,2) + playedBoard(3,3); % Sum elements in left-to-right diagonal
checkDIAGONAL_RL = playedBoard(1,3) + playedBoard(2,2) + playedBoard(3,1); % Sum elements in right-to-left diagonal
checkALL = [checkROWS, checkCOLS, checkDIAGONAL_LR, checkDIAGONAL_RL];     % Combine all checks into a vector for comparison

% Check if leading player has won
if ~isempty(find(checkALL == 3))
    gameOver = 'yes';
    WINNER = 1;
% Check if following player has won
elseif ~isempty(find(checkALL == -3))
    gameOver = 'yes';
    WINNER = -1;
end

% Check for a tie game (all cells filled, and no winner yet)
if (sum(sum(playedBoard == 0))) == 0 && ~strcmpi(gameOver, 'yes')
    gameOver = 'tie';
end
end