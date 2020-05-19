%%climate Change
% Australia is getting hotter, the polar ice caps are melting and polar bears are losing their homes ... Is climate change also affecting northern Germany?
% In the file [WetterBremen.txt] you will find a table (saved as a text file) with the records of the weather station Bremen for
% the past 70 years. (Source: Deutscher Wetterdienst, s.o.)
% To celebrate a perfect Christmas in spite of climate change, you should be prepared.
% Find out when, instead of a classic Christmas tree, you can hang the Christmas tree ornaments on a chic yucca palm tree.
% Load the data and make a table out of it.
% Extract the air temperature readings for the December, January, February and March winter months of the past 70 years.
% Perform a linear regression of this data and graph the data and regression line.
% In how many years is it to be expected that we have a pleasant 15 degrees in winter, when a Yucca palm feels really good?
% Use a screen output to tell your palm supplier which year you are due to your linear
% Regression would like to have a Yucca palm delivered.
% Systematically vary the degree of polynomial for data fitting and calculate R2 as the error measure.
% How does the estimation error change with increasing polynomial? Graph the dependency.
% Also depends on your estimate of when the time is ripe for the Christmas holly, systematically of the chosen one
% Polynomial off? Also graph this dependency.
%%
 % the aim of this script is to analysis the large text data which can be extracted(as table) from
 %And then finding out the date and temperature of the given time period
 %and then finding the regression line . Also this scropts deals with the
 %degree of polynomial, which can be extrapolated by using the syntax
 %polyfit and poly val and also try to fit the curve and finding the residual errors.
%% Lamichhane Amrit
%26.09.2019
 


%% Loading our data as table

data = readtable('WetterBremen.txt');
%% Variable Parameters

mess_data = data{:,2}; % measurement of the data 
mess_data = num2str(mess_data); % measurement of the data as string

luft_temperatur = data{:,4}; %air temperature as vector
luft_temperatur = num2str(luft_temperatur); %and making it string

date_temp = table(mess_data,luft_temperatur); % table  from both measurement data and air temperature
%% as stringfor the month of ddecember, january, feb and march , we can give the position of the 
%string as follows
month_5_position = [1 0 0 0]; % the string on the 5th position should be 1 
month_6_position = [2 1 2 3];% the winter falls if the 6th position of described string is 2,1 2and 3
%% This for loop already changes our string to the numbers for the provided 4 months(winter)
a=1;%pre-allocation
for n = 1:4
    for k = 1 : length(mess_data) %
        
        if mess_data(k,5) == num2str(month_5_position(n)) && mess_data(k,6) == num2str(month_6_position(n))
            all_winter_months(a,1) = k; % all_winter_months is the indicies for winter months
           
            a= a + 1; % total length of  all_winter_months 
        
    end % end if 
    end %end for
end% end for
%% Some datas can be extracted for 70 years
temp_70_years = date_temp(all_winter_months,:);% temperature for 70 years
 days_all=temp_70_years(:,1);% only the dates for 70 years in winter
days_all= table2array(days_all);% all the days in 70 years in table form
 temp=temp_70_years(:,2);%all the days in 70 years in are extracted
 %% for lineare Regression der Daten und Regressionsgerade
all_days_x = 1:length(all_winter_months); % lengtgh of all winter days
all_days_x = all_days_x'; % total_num of winter days
luft_temperature_y = temp_70_years(:,2);%%all the measurement of air  in 70 years in are extracted
luft_temperature_y = table2array(luft_temperature_y);% all the measurement of air in the past in 70 years in table form
luft_temperature_y = str2num(luft_temperature_y); % converting the strings to numvbers

%% Graphs for linear regression - first process
% we can use a linear regression by using polyfit and polyval
figure; % create new figure
plot(all_days_x,luft_temperature_y,'r+' ) ;%plot our data
 hold on
  poly = polyfit(all_days_x,luft_temperature_y,1);
 val = polyval (poly, all_days_x);
 plot(all_days_x, val,'k');%linear regression
xlabel('Number of days');%providing x label
   ylabel('Temperature / °C');%providing y label
   title('Tempertaure in Winter Months of last 70 years ');%providing the appropriate title
   legend('Temperatures(°C)','regression line');%legends
  %% Linear regression-- "second mehod/process (mathematical)
   % Fit to f(x)=b+m1*x
   N= length (all_days_x);
   X=[ones(N,1) all_days_x];
   %t=(X.'*X)./(X.'*lufttemperature_y );
   b=poly(2);% the intercept is at b
   m1=poly(1); % slope of our data is given by m1
  
   %% generate the line for graphics
   xa=min(all_days_x);% starting piont
   xb=max(all_days_x);% ending point
   x=linspace(xa,xb+10000,10);% jist to see betteer from our data
    f=b+ m1*x; % f is the linear fit (slope function)
   figure;
    plot(x,f,'-r');% regression line by mathematical method
   hold on
   plot(all_days_x,luft_temperature_y,'og'); % plotting other data 
   xlabel('Number of days');
   ylabel('Temperature / °C');
   title('Tempertaure in Winter Months of last 70 years ');
   legend('regression line','Temperatures(°C)');
   %% here , only for the 15 degress can be considered as also from 14 degress.
   % after knowing the slope, we can find where the temperature will be 14
   % or 15 according to the formula below
   t_15= (15-b)/m1; % year , (number of days where the temperature will becomes 15 degrees )
  t_15_all =find(all_days_x=='t_15');% all num of days where the tempertaure is more than 15 degree
% Now we can use the for loops to find the number of the days , where the
% temperature is 15 degree.
ship_day=0; % pre-allocation
  for i=1:length(t_15_all)
      ship_day=days_all(i,:);% it will give us the shipping day
     ship_day=str2num(ship_day);% changing the ship day to num
  end
   fprintf('I will order for the shipment of  the palm tress on %f \n',ship_day);% disply the appropriate shipment day
     % these are the days where the temperature will be 15 degress

%%
% Systematically vary the degree of the polynomial for data fitting 
%and calculate R2 as the error measure

%Create a few vectors of sample data points (x,y). Use polyfit to fit a first degree
%polynomial to the data. Specify two outputs to return the coefficients for the linear fit as well as the error estimation structure.
% p is the degree of polynomial
% for linear fit there are only 2 polynomial possible.
x = all_days_x; % given x
y = luft_temperature_y; % given y
p1 = polyfit(x,y,1);  % first degree of polynomial
p2=polyfit(x,y,2); % second degree of polynomial
figure;% create new figure
plot(x,y,'.'); %plot the given x and y 
hold on
plot(x,polyval(p1,x),'-r');% plotting first curve polynomial
plot(x,polyval(p2,x),'-g');% plotting second curve polynomial
y_fit = p1(1) *x + p1(2); % y_fit formula 
x_fit =p1(1) *y +p1(2);
%% residual error for data fittiong
y_residual_value =y-y_fit; % rsidual of y_formula
sq_R=sum(y_residual_value.^2); % sum of square residzual value is given by this formula
sq_total_R=(length(y)-1)* var(y); % var=varience
resudial_R2=1-sq_R/sq_total_R; % sum of residual square 
xlabel('Number of days');%providing x label
   ylabel('Temperature / °C');%providing y label
   title('Tempertaure in Winter Months of last 70 years ');%providing the appropriate title
   legend('Temperatures(°C)','first degree polynomial','second degree polynomial');%legends

   %% residual error of
   x_residual_value =x-x_fit; % rsidual of y_formula
sq_Rx=sum(x_residual_value.^2); % sum of square residzual value is given by this formula
sq_total_Rx=(length(x)-1)* var(x); % var=varience
resudial_R2x=1-sq_Rx/sq_total_Rx; % sum of residual square 

%%
%% Estimation error
% it is the root mean squared error of the residual error
mean_residual_error=mean(resudial_R2);
err=sqrt(mean_residual_error);
x_mean_residual_error=mean(resudial_R2x);
x_err=sqrt(x_mean_residual_error);
