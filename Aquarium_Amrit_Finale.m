%% Aquarium
%  In your aquarium, the series of measurements [phWerte.mat] of the
%  aquarium water was made. • Your fish tolerate the range of pH 6.5 to pH
%  7.5 well, but are at risk above and below. • If you look at the data,
%  you will see if there are obvious measurement errors in this data set.
%Think of a good way to find it automated.
%  Plot the measurement series pH values so that they represent the
%  measured values inside and
%outside the tolerance range as well as the measurement errors with symbols
%in three different colors.
%%
% the basic idea of the script is to find out the pH values of water in
% betwwwen 6.5 and 7.5, also the pH below and after the given values are
% represented by the same colour and the value inside are represented by
% different colour.Also, the measurement errors are also represented by
% different colours.Mostly the find command is used to determine the given
% task.
%%
%Lamichhane Amrit 22.09.2019

%%
clear ;              %  delete All variable
close all;              % all programs/windows inside  Matlab close
clc;                    % delete command window

%%
load phWerte.mat; % loading the given mat file
%% In percentile as in given script
prctile_25= prctile (pH,25); %for 25 percentile formula
prctile_75= prctile (pH,75); %for 75 percentile formula
%%
out_limit1 =prctile_25 - 1.5 * (prctile_75-prctile_25); % formula for more than 25 percentile
out_limit_2 = prctile_75 + 1.5 * (prctile_75-prctile_25); %formula for less than 25 percentile
%% Using for loop for the errors , when the pH werte falls in the limit from out_limit_1
%and out_limit_2. errror value is given by err_value and their indixes are
%symbolized as err_indx. Let assume, it starts reading the error from 1, so
%that first value of x =1(pre_allocating). And n is the length of the Ph
%value till the errors are found out.
%% Pre-allocation of the defined variables
x=1; % iteration required for loop
err_value=0; %pre-allocationg the error_value
err_indx=0; %%pre-allocationg the error_index
for n=1:length(pH)
    if pH(n) < out_limit1 || pH(n)> out_limit_2
        err_value(x)=pH(n); % shows the error, even after pre -allocating, dont know why?
        err_indx(x)=n;
        x=x+1;
    end
end
%%
S1=find(pH>7.5); % equal or more than 7.5
S1_1=pH(S1);%find the indices for S1
S2=find(pH<6.5); % equal or less than 6.5
S2_2=pH(S2);%find the indices for S2
S3=find(6.5>pH<7.5);% the pH in betwwen 6.5 and 7.5
S3_3=pH(S3);% finding the indices for S3
%%
plot(S1,S1_1,'*g');% more than 7.5
hold on
grid on
plot(S2,S2_2,'*g');% less than 6.5
plot(S3,S3_3,'ys');% in beteen
plot(err_indx,pH(err_indx),'or');%for the errors of the measurements
xlabel('Number of fishes'); %providing x label to grphic
ylabel('pH scale'); % providing the ylabel
title('pH values of Water inside Aquarium '); % appropriate title
legend('pH >7.5','pH<6.5','6.5>pH<7.5','errors') ;%legend
hold off
