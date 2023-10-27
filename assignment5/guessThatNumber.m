function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Taylor Kinney
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it,
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them.
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

%% MAJOR BUG FOUND: WHY NO INDENTATION? :(

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
    'This program plays the game of Guess That Number in which you have to guess\n', ...
    'a secret number.  After each guess you will be told whether your \n', ...
    'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): ');

while level ~= beginner && level ~= moderate && level ~= advanced
% BUG FOUND (1): The condition level ~= beginner || level ~= moderate || level ~= advanced
% will always be true. A variable cannot be not equal to all three values
% simultaneously. To fix this, I changed the "||" to "&&".
    fprintf('Sorry, that is not a valid level selection.\n')
    level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

if level == beginner
% BUG FOUND (2): I found this by trying to run the code and getting a incorrect
% use of '=' error message. To fix this, I added a second equals sign in
% order to make this a conditional statement, rather than a variable
% assignment.

    highest = beginnerHighest;

elseif level == moderate

    highest = moderateHighest;

else
    highest = advancedhighest;
end

% randomly select secret number between 1 and highest for level of play

secretNumber = floor(rand() * highest) + 1;
% BUG FOUND (3): Order of operations. In the original code "1 * highest"
% equates to highest, and then the random number between 0 and 1 is added
% to this. Then, floor rounds the number back down to "highest". As a result,
% "secretNumber" always equates to "highest".
% To fix this, I simply multiplied the random number by "highest" to scale it
% to the desired range. Then, I added 1 to ensure that the secret number
% falls within the range of 1 to "highest" inclusively. Finally, I used
% floor() to round down the result to the nearest integer.

% initialize number of guesses and User_guess

numOfTries = 1;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber

    % get a valid guess (an integer from 1-Highest) from the user

    fprintf('\nEnter a guess (1-%d): ', highest);
    userGuess = input('');
    while userGuess < 1 || userGuess > highest
% BUG FOUND (4): The condition userGuess < 1 || userGuess >= highest is not
% inclusive of a user guess of the highest number. To fix this, I changed
% "greater than or equal to" to simply "greater than."

        fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

        userGuess = input('');

    end % of guess validation loop

    % add 1 to the number of guesses the user has made

    % numOfTries = numOfTries + 1;
% BUG FOUND (5): This iteration is not in the correct spot. This should be
% placed within the ifelse statement below, AFTER the user's guess has been
% deemed incorrect. To fix this, I placed it in the correct locations
% within the ifelse statement. 

    % report whether the user's guess was high, low, or correct

    if userGuess < secretNumber
% BUG FOUND(6): The conditional statement does not agree with the string
% displayed in the fprintf argument below. To fix this, I changed the
% "greater than" operator to a "less than" operator.
        fprintf('Sorry, %d is too low.\n', userGuess);
        numOfTries = numOfTries + 1;
    elseif userGuess > secretNumber
        fprintf('Sorry, %d is too high.\n', userGuess);
        numOfTries = numOfTries + 1;
    elseif numOfTries == 1 && userGuess == secretNumber
% BUG FOUND (7): The original condition numOfTries == 1 has no indication
% that compares userGuess to secretNumber. To fix this, I added "&&
% userGuess == secretNumber" to truly determine if the user guessed the
% number on the first try.
        fprintf('\nLucky You!  You got it on your first try!\n\n');
    else
        fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
            secretNumber, numOfTries);
% BUG FOUND (8): The original fprintf statement does not indicate how many
% guesses it took the user. To fix this, I added the numOfTries variable to
% as the final input argument of the fprintf function.
    end
% BUG FOUND(9): The above ifelse statement did not have a closing argument...
% To fix this, I added an end in order to close the ifelse statement.

    %fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
% BUG FOUND (10): This fprintf statement is in the incorrect spot.
% Should be outside the guessing loop. To fix this I changed its location

end  % of guessing while loop

fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');


end % end of game