I = exp(1)-1;         

for n = 1:20
    I_new = exp(1)-n*I(end);  
    I = [I I_new];         
end

fprintf('   n \t  I_n \n-------\t--------\n');
fprintf('   %d\t%7.6f \n',[0:20; I]);