%% Question:
%Program a guessing game that guesses a number the user thinks up with as few yes / no questions as possible:
%Think of an algorithm that requires as few questions as possible to guess an integer between 1 and 100.
%Write a user dialog asking the user to come up with a number and your program guesses it. The program proposes a number for each and the user can react accordingly.
%At the end, have the number of questions the program needs to guess.
%Make your program more general so that it works not only for Room 1 - 100, but for a user-selectable upper limit.
%%
 %So we need to make a programm that guess our number from 1 to 100. For that we need to set up the upper limit
 % one can  make it more interesting by puttting name of players and then
 % the program welcomes the guest and ask if the number is Smaller or equal
 % to the guessed number and finally , it reconize the guessed number.
 %For this kind of programm, using loops 'while ' make more sense,and
 %changing the variables using 'if' 'else' are also equally important.
 %%
% Amrit Lamichhane
%2019.09.16
%RATESPEIL
%%
 %%* Solution*:
%% Lets play a guesing game with yes or no.You can guess any number from 1 to 100 and ultimatey it reconizes the game and gives the number of guesses as
% well. After giving the upper limit
%% Parameters required for this Function are :
%set a upper limit as upper_limit
%set a lower limit as lower_limit
%mean is given by the mittel

%%
clear ;         % clear the workspace
close all;    %close all othe running programm inside Matlab         
clc;            %clear the command window        
%% 
fprintf(' Hi, Welcome to the Game of Guess my Secret Number!\n')% It prints as the main title for Guessing Game
disp(' ') 
player = input('\nYour Name is : ','s'); % you can give your name here
fprintf('\nWelcome %s',player);% this greets  the user with name to play this game 
disp(' ');

%%
upper_limit = input('Give the upper limit: ');% give the upper limit for the number from 1 to 100
while upper_limit ~= round(upper_limit) || upper_limit <=0 %while loop till the lower limit is equal to upper limit
    upper_limit = input('My number');
end


%%
lower_limit = 0;% set the lower limit first as 0 (so that lower we can also guess 1)
Trial = 0;% first trial is set as zero
Mittel = ceil((upper_limit-lower_limit)/2);% make a mean from higher and lower
%% after this  we use the while loop unitl the lower limit is smaller or equal to upper limit
while  lower_limit< upper_limit
    
    user_ans = questdlg(sprintf('Is the number smaller  or equal to %d?',Mittel), 'ratespiel','Yes','No','Yes');%Ask the question is smaller or equal
    if strcmp(user_ans,'Yes')  %if yes is pressed                                                                                   % to the quesed number with yes and No option. 
        upper_limit =Mittel; % upper_limit is now changed to mean value
    elseif strcmp(user_ans,'No') % if no iss pressed
        lower_limit = Mittel;% than lower_limit is equal to mean value  
    else
        break % else it would break the loop
    end %end the if
        Mittel=round((upper_limit-lower_limit)/2)+ lower_limit; % Now the guess  is equal to lower_limt and mean of the the guessed 
       if Mittel== upper_limit % so that mittel is also equal to upper limit
           disp('Thats it') % thats when it guesssed your number
    break % brak the loop
       else 
       end  %end the  if nothing happens
           
    Trial = Trial + 1; % no of trial increases after each entry
end

fprintf('You guessed %d . It took you  %d triAL.\n', lower_limit+1, Trial);% when it guesses smaller or equal number after the lower number becomes the upper limit 
                                                                            %Our guess is just far away from 1, so that 1 is added and then it reconizes our guess
% print the guessed number with number of trial


