% Main Game Board Creation
function mainGameBoard (~,~,user,comp)
% mainGameBoard - This function creates the main tic tac toe GUI and its
% many components. It has multiple nested functions that allow for computer
% generated moves and allow the user to restart the game following
% completion of the prior game. 
close(allchild(0))

user1 = user;
comp1 = comp;

%% Constants
% RGB Colors
ecuPurple = [.31 .18 .5];
ecuGold = [1 .78 .18];

% Positions
screenSize = get(groot,'ScreenSize'); % because each user's screen size may be different, this argument handles that
%                                       returning a 1x4 row vector with ...
%                                       [(leftToRight ratio), (bottomToTopRatio), (WidthInPixels),(HeigthInPixels)]
WHRatio = screenSize(3)/screenSize(4); % obtain width to height ratio
W = .15; % set the width of each TicTacToe Button
H = .15*WHRatio; % set the height of each TTT button
BT = .9 - H; % set the screen location of the 1st row of TTT buttons

%% create figure for the game board
mainFig = figure('Units', 'normalized', 'Position', [.125 .125 .8 .8], ...
    'Color', ecuPurple, 'MenuBar','none', 'NumberTitle','off');

% create a title for the main game board
primaryTitle = uicontrol('Style','text','Units','normalized','Position', [.325 .9 .4 .08],...
    'String','Tic Tac Throwdown', 'FontWeight','bold','FontSize',30,...
    'BackgroundColor',ecuPurple,'ForegroundColor',ecuGold,'FontName',...
    'Ravie');

% create a dynamic text that identifies whose turn it is
whoseTurn = uicontrol('Style','text','Units','normalized','Position', [.1 .75 .1 .15],...
    'String','Whose Turn:', 'FontWeight','bold','FontSize',20,...
    'BackgroundColor',ecuPurple,'ForegroundColor',ecuGold,'FontName',...
    'Ravie');
%% BONUS REQUIREMENT 1 - Ask the user if they want to go first or not
whoGoesFirst = questdlg("Are you a Leader or Follower?",... % This question determines who goes first - user or computer
    'Who Goes First', 'Leader','Follower','Follower');
switch whoGoesFirst % switch conditional to handle the answer to whoGoesFirst
    case 'Leader' % If user selects 'Leader' then they get to go first
        startingPlayer = user1;
        userInteger = -1; % userInteger is how I will keep track of plays and determine a winner.
        followingPlayer = comp1;
    case 'Follower'
        startingPlayer = comp1;
        userInteger = 1; % leading player will be +1; following player will be -1
        followingPlayer = user1;
end

% Create structure to store dynamic UI variables that update each turn/game
% This way I don't have tons of inputs into my functions
%% REQUIREMENT 4 - PROMPT USER FOR MOVE
DYNAMIC_UI.youreup = uicontrol('Style','text','String',startingPlayer,... % constantly updating text that signifies whose turn it is
    'Value', userInteger,'UserData', followingPlayer,... % userInteger is the integer (either -1 or +1 of current player)
    'Units','normalized', 'Position', [.05 .60 .2 .2],... % followingPlayer is string of who's up next
    'FontWeight','bold','FontSize',20,...
    'BackgroundColor',ecuPurple,'ForegroundColor',ecuGold,'FontName',...
    'Ravie');
% create an inivisible game board that keeps track of the plays and allows for
% determination of a winner
DYNAMIC_UI.playTracking = uicontrol('Style','text','Visible','off','UserData',zeros(3,3));
% Based on the answer to 'whoGoesFirst, values for leading player (user OR computer) from switch case are assigned here
DYNAMIC_UI.leadingPlayer = uicontrol('Style','text','Visible','on','String','0',...
    'Value', userInteger, 'UserData',0, ...
    'Units','normalized', 'Position', [.05 .4 .1 .05],... % followingPlayer is string of who's up next
    'FontWeight','bold','FontSize',15,...
    'BackgroundColor',ecuPurple,'ForegroundColor',ecuGold,'FontName',...
    'Ravie'); % Value assigns the player an integer for the board to keep track of, UD keeps track of wins (if playing multiple games)
% Copy & paste of leadingPlayer, keeps track of followingPlayer (user OR computer) instead
DYNAMIC_UI.followingPlayer = uicontrol('Style','text','Visible','on','String','0',...
    'Value', -userInteger, 'UserData',0, ...
    'Units','normalized', 'Position', [.15 .4 .1 .05],... % followingPlayer is string of who's up next
    'FontWeight','bold','FontSize',15,...
    'BackgroundColor',ecuPurple,'ForegroundColor',ecuGold,'FontName',...
    'Ravie');
DYNAMIC_UI.leadingPlayerWinColumn = uicontrol('Style','text','Visible','on','String',[startingPlayer, '''s # of wins'],...
    'Units','normalized', 'Position', [.05 .45 .1 .15],... % followingPlayer is string of who's up next
    'FontWeight','bold','FontSize',15,...
    'BackgroundColor',ecuPurple,'ForegroundColor',ecuGold,'FontName',...
    'Ravie'); % Value assigns the player an integer for the board to keep track of, UD keeps track of wins (if playing multiple games)
% Copy & paste of leadingPlayer, keeps track of followingPlayer (user OR computer) instead
DYNAMIC_UI.followingPlayerWinColumn = uicontrol('Style','text','Visible','on','String',[followingPlayer, '''s # of wins'],...
    'Units','normalized', 'Position', [.15 .45 .1 .15],... % followingPlayer is string of who's up next
    'FontWeight','bold','FontSize',15,...
    'BackgroundColor',ecuPurple,'ForegroundColor',ecuGold,'FontName',...
    'Ravie');
%% REQUIREMENT 9 - Ask user if they would like to play again
DYNAMIC_UI.restartButton = uicontrol('Style','pushbutton','Units','normalized', ...
    'Position', [.075 .15 .15 .15], 'String','Start New Game',...
    'FontWeight','bold','FontSize',12,...
    'BackgroundColor',ecuGold,'ForegroundColor',ecuPurple,'FontName',...
    'Ravie', 'visible', 'off'); % will only visible after the game is over
%% REQUIREMENT 3 - CREATION OF PHYSICAL GAMEBOARD & REQUIREMENT 8A - FOR LOOP
% Board laid out as such (for comment explanation-sake)
% [ 1 2 3 ]
% [ 4 5 6 ]
% [ 7 8 9 ]

for rows = 1:3
    LR = .3; % initialize the LeftToRight location of ticTacToeGrid on mainFig for buttons 1,4,7
    for columns = 1:3
        % iterate through 3 columns for 3 separate rows to create a button
        % on mainGameBoard
        ticTacToeGrid{rows, columns} = uicontrol('Style','pushbutton', 'Units','normalized',...
            'Position',[LR BT W H], 'UserData', [rows,columns],...
            'BackgroundColor',ecuGold);
        LR = LR + W; % update the LeftToRight location where each button must be placed BEFORE resetting the column loop
    end
    BT = BT - H; % after each column has been created, update the BottomToTop location of each row
end

%% REQUIREMENT 6 - GENERATE COMPUTER MOVE
% if computer goes first, randomly select a button
if strcmpi(startingPlayer, comp1)
    pause(1)
    firstMoveRowComputer = randi(3);
    firstMoveColComputer = randi(3);
    ticTacToeGrid{firstMoveRowComputer,firstMoveColComputer}.String = DYNAMIC_UI.youreup.String;
    set(ticTacToeGrid{firstMoveRowComputer,firstMoveColComputer},'Enable','off')
    DYNAMIC_UI.youreup.String = followingPlayer;
    DYNAMIC_UI.youreup.UserData = startingPlayer;
    DYNAMIC_UI.youreup.Value = DYNAMIC_UI.followingPlayer.Value
    openingBoard = zeros(3,3);
    openingBoard(firstMoveRowComputer,firstMoveColComputer) = 1;
    DYNAMIC_UI.playTracking.UserData = openingBoard;
end
%% REQUIREMENT 5 - DISPLAY UPDATED GAME BOARD
% iterate through 3 columns for 3 rows to update ticTacToeGrid
% based on where the player has selected to move
for rows1 = 1:3
    for columns1 = 1:3
        set(ticTacToeGrid{rows1, columns1},'Callback',{@Played,ticTacToeGrid,DYNAMIC_UI})
    end
end


    function Played(object,~,ticTacToeGrid, DYNAMIC_UI)
% Played - This nested function handles user and computer moves and stores
% them in 'playedBoard' which is then used to check for winConditions and
% eventually determine a winner for the current game. 

        clickedPosition = object.UserData; %store the row, column that was most recently clicked
        comp2 = 'Computer';
        % update the physical ticTacToe grid to display the player's name
        % that clicked the button
        ticTacToeGrid{clickedPosition(1), clickedPosition(2)}.String = DYNAMIC_UI.youreup.String;

        % prevent a player from clicking a previously clicked button
        set(ticTacToeGrid{clickedPosition(1),clickedPosition(2)},'Enable','off')

        % update the invisible UI with the location of clicks
        % if leadingPlayer clicks, a +1 will appear in place of 0,
        % if followingPlayer clicks, a -1 will appear in place of 0
        playedBoard = DYNAMIC_UI.playTracking.UserData


        playedBoard(clickedPosition(1),clickedPosition(2)) = DYNAMIC_UI.youreup.Value;
        DYNAMIC_UI.playTracking.UserData = playedBoard
        [gameOver,WINNER] = winConditions(playedBoard);

        [DYNAMIC_UI, ticTacToeGrid] = winChecker(gameOver,WINNER,DYNAMIC_UI,ticTacToeGrid);

        if strcmpi(gameOver,'yes') | strcmpi(gameOver, 'tie')
            DYNAMIC_UI.restartButton.Callback = {@restartGame,ticTacToeGrid,DYNAMIC_UI};
        end

        if strcmpi(DYNAMIC_UI.youreup.String, comp2) && strcmpi(gameOver, 'no')
            DYNAMIC_UI.youreup.Value
            DYNAMIC_UI.youreup.String
            compClick = computerMove(playedBoard);
            playedBoard(compClick(1),compClick(2)) = DYNAMIC_UI.youreup.Value
            ticTacToeGrid{compClick(1), compClick(2)}.String = DYNAMIC_UI.youreup.String;
            set(ticTacToeGrid{compClick(1),compClick(2)},'enable','off');
            DYNAMIC_UI.playTracking.UserData = playedBoard
            [gameOver,WINNER] = winConditions(playedBoard);
            [DYNAMIC_UI,ticTacToeGrid] = winChecker(gameOver,WINNER,DYNAMIC_UI,ticTacToeGrid);
            if strcmpi(gameOver,'yes') | strcmpi(gameOver, 'tie')
                DYNAMIC_UI.restartButton.Callback = {@restartGame,ticTacToeGrid,DYNAMIC_UI};
            end
        end
    end

    function restartGame(object,~,ticTacToeGrid,DYNAMIC_UI)
% restartGame - This nested function allows the user to press a button that
% appears following the completion of the current game. If the user presses
% the button then the game board is reset. Whoever was the winner of the
% previous game will be the leading player for the next game. 
        object.Visible = 'off'; % reset restartGame button
        DYNAMIC_UI.playTracking.UserData = zeros(3,3);
        comp2 = 'Computer';
        for rows2 = 1:3
            for columns2 = 1:3
                % iterate through 3 columns for 3 rows to allow each button
                % to be pressed again
                set(ticTacToeGrid{rows2, columns2}, 'enable','on','String','')
                set(ticTacToeGrid{rows2, columns2}, 'Callback', {@Played, ticTacToeGrid, DYNAMIC_UI})
            end
        end
        if strcmpi(DYNAMIC_UI.youreup.String, comp2)
            pause(1)
            firstMoveRowComputerRestart = randi(3);
            firstMoveColComputerRestart = randi(3);
            ticTacToeGrid{firstMoveRowComputerRestart,firstMoveColComputerRestart}.String = DYNAMIC_UI.youreup.String;
            DYNAMIC_UI.youreup.String = DYNAMIC_UI.youreup.UserData;
            DYNAMIC_UI.youreup.UserData = comp2;
            openingBoardRestart = zeros(3,3);
            openingBoardRestart(firstMoveRowComputerRestart,firstMoveColComputerRestart) = -1;
            DYNAMIC_UI.playTracking.UserData = openingBoardRestart;
            set(ticTacToeGrid{firstMoveRowComputerRestart,firstMoveColComputerRestart},'Enable','off');
        end
    end
end