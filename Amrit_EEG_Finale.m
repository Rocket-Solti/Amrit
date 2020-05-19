%%Structures can be used in combination with cell arrays. There are cell arrays that contain structures and vice versa.
% Here is an example:
% During an internship, an EEG measurement (EEG = electroencephalogram, measurement of brain waves) was performed.
% After the evaluation (which we want to neglect now), the data in
% Matlab saved in the file [experiment1.mat]. If you load this file, you will notice
% that it contains only one variable of type cell (with 2 elements). All information is stored in this variable
% that belongs to the experiment. ??
% Task:

% Load the file and look at the contents of the cell variable:
% The first element is a structure containing the information about the experiment, e.g. the name of the original file and the number of measurement points.
% The second element contains the measured data. These are EEG signals in ?V recorded at 500 Hz.
% Create a graph with one sub image per trial subject. Plot the data with meaningfully labeled axes and the name of the subject as the title.

% If you look at the data, you will see that the signal changes sharply from a certain point in time.

% Consider a method to automatically determine this time and expand the cell variable by the time of that change for each subject.
% Mark these change points in the graphic.
% Create a new cell variable that has the same structure as the previous one, but contains only the data of the uniquely student subjects.
% Remember to adjust the information stored in the variable.
%%
%this script can be used to plot the datas produced by per person per
%subect alongside with the change in the signal with mark* , also helps to
%store the variable as cell and number as double at the end.
%% Lamichhane Amrit
%% 24.09.2019
%% loading our given mat file
load ('experiment1.mat' ,'experiment1' );
A=experiment1{1}; % all the struct field of our mat file
A1=experiment1{1,1}.Names ;%  the names of theall people student and others
C=experiment1{2};% datas yeilded by differentsubjects
B1=experiment1{1,1}.Measurements ;%only the measuremts (not asked, but just tried to give the basic idea)
figure; % create new figure
%% using for loop here to genertae the different graphics for different subjects as well
% as the chngae in signals in different time scale.
%length of k is the row of the given data set (C)
for k=1:length(C(1,:))
    change_sig=abs(diff(C(:,k))); % change in signal is given by the absolute difference of the each column of datasets.
    % d_m= difference zwischen signals
    %time_d= timepoint at maximum difference
    [d_m,time_d]=max(change_sig); % will give the maximun sugnal change at the point
    max_sig= C (time_d,k); % Index for maximnum signal change
    subplot(5,2,k); % create 10 plots in as 2 columsa, each rows consist of 5 graphics
    plot(C(:,k),'r'); % plotting the give data per subject with red marker
    hold on ;%hold the graps till the changes in signals are plotted
    grid on; % grid on to see the datas more precisely
    h= plot(time_d,max_sig,'g*'); % plotting the difference
    xlabel('\textit{Time} (ms).','Interpreter','latex');
    ylabel('\textit{Amplitude} (uV)','Interpreter','latex');
    title( char(A1(k)));
    legend(h,'signal-change','location','best');%providing the ledend with best location
end
hold off
%%%
% here, one can simply find the names of students and thier indexs alsop
% by using for loops we are able to store the name of the students in cell
% array which is described below:
%stds= only the string for the cell containg only students
%N_stds= Names of students only
%Idx= index for the names of the students
Stds=contains(experiment1{1,1}.Names,'student');%only students
N_stds=experiment1{1,1}.Names(Stds); % names of the students only
Idx=find(contains(experiment1{1,1}.Names,'student'));% find the index of the student
%% Again the use of for loop to determine the datas of respective subjects along with their names
%% N_stds= Datas of students stored  as cell array only of the students
% daten_studenten = datas yeilded by the students only which are also
% stored.%%
%% Pre-allocation
Daten_Studenten=zeros(300,length(Idx)); %preallocating, with same length sizes of given datas
a=1; %start the index of students from 1
%N_stds is already defined earlier
%strfind is used to find the string
%daten_student stored the datas of students only
%N_stds stored the names of students only as cell
for n = 1:length(Idx)
    if strfind (experiment1{1, 1}.Names{n}, 'student')
        N_stds{a}= A1(n);
        Daten_Studenten(:,a) = C (:,a);
        
        a= a+1;
    end
end