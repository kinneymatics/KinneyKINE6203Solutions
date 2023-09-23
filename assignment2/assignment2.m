%% REQUIREMENT 1 - COMMENT SECTION
% This script allows the user to play tic tac toe against the computer...
% Good Luck!
% Assignment 2: Tic Tac Toe
%
% Submitted by: Taylor Kinney
%
% Detailed Description:
% assignment2.m makes use of mainGameBoard.m, checkWin.m, and
% computerPlayer.m to create a user interface that allows the user to:
% a) choose the difficulty of the computer they will play tic tac toe
% against
% b) choose if they want to be the leading or following player
% c) physically click a button to make their turn and see the user
% interface update with their move in real-time
% d) play multiple games of tic tac toe against the computer until there is a winner or there
% is a tie
% e) see how many times they have beaten the computer
%
% Written using MATLAB 2023a
% Tested on Alienware 17 R5
% Last Updated: 9-22-2023 @ 10pm
%
% References: https://youtu.be/THGC0Hd3K9g?si=CtIvfs1PgcM1xhxb
%             https://youtu.be/Ir30tCoCiVM?si=TVSp0UlAI3z_1lrC

%% CONSTANTS
% set the color of the GUI to ECU purple using RGB percentage color codes
ecuPurple = [.31 .18 .5]; % RGB percentages of ECU purple (per branding webpage)
ecuGold = [1 .78 .18]; % RGB percentages of ECU gold (per branding webpage)
bowlOfNails = imread('bowlofnails.jpeg'); % jpeg meme for 'hard' difficulty
WeenieHutJrs = imread('weeniehutjr.jpeg'); % jpeg meme for 'easy' difficulty

%% REQUIREMENT 2 - WELCOME MESSAGE & PROMPT
% Display a welcome message and prompt the user to start the game
uiwait(msgbox(["Hi! I want to play Tic Tac Toe, will you play with me? ";...
    "Click ''Okay'' to get started!"]));

%% Select Difficulty GUI
% Create a graphical user interface for selecting the game difficulty
difficulty = figure('Units', 'normalized', 'Position', [.125 .125 .8 .8], ...
    'Color', ecuGold, 'MenuBar','none', 'NumberTitle','off');
difficultyText = uicontrol('Style','text','String', ...
    {'Welcome to the Salty Spitoon,','How Tough Are Ya?'}, ...
    'Units', 'normalized', 'Position', [.125 .8 .75 .125], ...
    'BackgroundColor', ecuGold, 'ForegroundColor', ecuPurple, ...
    'FontSize',20, 'FontWeight','bold', 'FontName', 'Ravie');
easy = uicontrol('Style','pushbutton',...
    'Units', 'normalized', 'Position', [.1 .25 .35 .5], ...
    'UserData', 'easyMode', ...
    'BackgroundColor', ecuPurple, 'ForegroundColor', ecuGold, ...
    'FontSize',14, 'FontWeight','bold', 'FontName', 'Ravie');
easy.Units = 'pixels';
easyWidth = easy.Position(3);
easy.CData = imresize(WeenieHutJrs,[ceil(easyWidth),NaN]);
%% BONUS REQUIREMENT 2 - MAKE COMPUTER IMPOSSIBLE TO BEAT (NEVER COMPLETED :/ )
% Create a button for 'hard' difficulty and apply an image to it
hard = uicontrol('Style','pushbutton',...
    'Units', 'normalized', 'Position', [.5 .25 .35 .5], ...
    'UserData', 'hardMode', ...
    'BackgroundColor', ecuPurple, 'ForegroundColor', ecuGold, ...
    'FontSize',14, 'FontWeight','bold', 'FontName', 'Ravie');
hard.Units = 'pixels';
hardHeight = hard.Position(4);
hard.CData = imresize(bowlOfNails,[ceil(hardHeight),ceil(hardHeight)]);

% Set callback functions for the difficulty buttons
easy.Callback = {@playMode, easy, hard};
hard.Callback = {@playMode, easy, hard};


%% Handling User Difficulty Selection
function playMode(object, ~, easy, hard)

object.UserData
% Determine the selected game difficulty and enable/disable buttons accordingly
if strcmpi(object.UserData,"easyMode")
    easy.Enable = 'on';
    hard.Enable = 'off';
    user = getenv('USERNAME');
    comp = 'Computer';
    startGame = uicontrol('Style','pushbutton',...
        'Units','normalized', 'Position', [.35 .1 .3 .1],...
        'String', 'Let''s Play!', 'FontSize',14,...
        'FontWeight','bold', 'FontName', 'Ravie',...
        'BackgroundColor',[0.31, 0.18 0.5],'ForegroundColor',[1 .78 .18]);
    startGame.Callback = {@mainGameBoard,user,comp};

elseif strcmpi(object.UserData, "hardMode")
    easy.Enable = 'off';
    hard.Enable = 'on';
    user = getenv('USERNAME');
    comp = 'Computer';
    startGame = uicontrol('Style','pushbutton',...
        'Units','normalized', 'Position', [.35 .1 .3 .1],...
        'String', 'Let''s Play!', 'FontSize',14,...
        'FontWeight','bold', 'FontName', 'Ravie',...
        'BackgroundColor',[0.31, 0.18 0.5],'ForegroundColor',[1 .78 .18]);
    startGame.Callback = {@mainGameBoard,user,comp};

else
    fprintf('should not happen. error in playMode!');
end
end
%% REMAINING REQUIREMENTS SATISFIED IN mainGameBoard.m, checkWin.m, or computerPlayer.M