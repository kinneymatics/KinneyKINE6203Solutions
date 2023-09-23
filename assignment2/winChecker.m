function [DYNAMIC_UI,ticTacToeGrid] = winChecker(gameOver,WINNER,DYNAMIC_UI,ticTacToeGrid)
% winChecker - This function checks if the tic tac toe game is over or
% ongoing and perform the necessary actions accordingly, based on the
% inputs from winConditions.m and mainGameBoard.m.

%% REQUIREMENT 7 - KEEP GOING UNTIL WINNER/NO MORE MOVES
% After a move has been made, if a winCondition has not been met, swap
% current and next players. 
if strcmpi(gameOver,'no')
    currentPlayer = DYNAMIC_UI.youreup.String;
    nextPlayer = DYNAMIC_UI.youreup.UserData;
    DYNAMIC_UI.youreup.String = nextPlayer;
    DYNAMIC_UI.youreup.UserData = currentPlayer;
    DYNAMIC_UI.youreup.Value = -DYNAMIC_UI.youreup.Value;

% if gameOver equates to 'yes', display the name of whoever made
% the winning move (player that made the click)
elseif strcmpi(gameOver,'yes')
    if WINNER == DYNAMIC_UI.youreup.Value
        winningPlayer = DYNAMIC_UI.youreup.String;
        % if the winner happens to be the player who is next up, throw
        % an error because this is impossible
    else
        winningPlayer = DYNAMIC_UI.youreup.UserData;
        error("Error. The awaiting player can not win...")
    end
% Update the win count for the winning player
    if WINNER == 1
        DYNAMIC_UI.followingPlayer.UserData = DYNAMIC_UI.followingPlayer.UserData + 1;
        DYNAMIC_UI.followingPlayer.String = num2str(DYNAMIC_UI.followingPlayer.UserData);
        % if neither win column updated, throw an error
    elseif WINNER == -1
        DYNAMIC_UI.leadingPlayer.UserData = DYNAMIC_UI.leadingPlayer.UserData + 1;
        DYNAMIC_UI.leadingPlayer.String = num2str(DYNAMIC_UI.leadingPlayer.UserData);
        % if winner is followingPlayer, update following player's win
        % column
    else
        error('Error during win counting...');
    end
    DYNAMIC_UI.playTracking.UserData = zeros(3,3); % reset the tracking board
    DYNAMIC_UI.restartButton.Visible = 'on'; % after a winCondition is met, display the restart button
    for rows = 1:3
        for columns = 1:3
            % after a winner is determined, prevent any more
            % buttons from beign pressed
            set(ticTacToeGrid{rows, columns}, 'enable','off')
        end
    end
    % when restart button is pressed run the restart game function
    % to reset the game board
    %DYNAMIC_UI.restartButton.Callback = {@restartGame,ticTacToeGrid};
elseif strcmpi(gameOver, 'tie')
    DYNAMIC_UI.playtracking.UserData = zeros(3,3);
    DYNAMIC_UI.restartButton.Visible = 'on';
    %DYNAMIC_UI.restartButton.Callback = {@restartGame, ticTacToeGrid};
end
end