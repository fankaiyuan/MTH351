% Henrici_example_stable.m
% This is an example of the numerically stable recursive 
% calculation of the integral of
% x^n/(x+10) between 0 and 1.  
% (See Peter Henrici, Essentials of Numerical Analysis 
% With Pocket Calculator Demonstrations, p.35) 

% This is the approximate value of the integral for n = 50:     
I = 0;        
                       

% Next: compute the sequence of integrals for n = 49 to 0 
% and store them in an array. 
% Apply the recursive formula. 
% I(1) is the first value in the array I. 
% I = [I_new I] puts the new value (I_new) 
% at the beginning of the array. 
for n = 50:-1:1
    I_new = (1/n-I(1))/10;  
    I = [I_new I];           
end

fprintf('   n \t  I_n \n-------\t--------\n');
fprintf('   %d\t%7.10f \n',[0:50; I(1:51)]);  
