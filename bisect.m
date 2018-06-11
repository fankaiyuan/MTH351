% bisect.m
% An implementation of the bisection method for finding a root.
% Usage:  c = bisection(a, b, tol, N).
%   a -- the left side of the desired interval
%   b -- the right side of the interval
%   tol -- the desired tolerance. The default is 1e-6
%   N   -- the desired number of iterations to run. The default is 50.
% The actual function must be specified in the .m file
%
% Example usage c = bisect(1, 2); 
%               c = bisect(1,2,1e-7);
%               c = bisect(1,2,1e-7,30); 


function c = bisect(a, b, tol, N)

% tol and N are assigned default values when BISECT(a,b) is specified.
% N is assigned the value infinity when BISECT(a,b,tol) is specified; 
% then tol is guaranteed.

    switch(nargin)
        case 2
            N = 50; tol = 1e-6;      
        case 3
            N = inf;                
        otherwise                   
            %do nothing
    end

    % ENTER THE APPROPRIATE FUNCTION HERE
    % This defines an anonymous function; 
    % 'help function_handle' provides more information. 
    
    f = @(x) x^3 - 25;
    
    fa = f(a); fb = f(b);
    
    %Check to make sure the input was valid
    if(a >=b)
        error('We require a < b');
    elseif(sign(fa)*sign(fb) > 0)
        error('The sign of f is the same at a and b');
    end

    its = 1;            %number of iterations run so far
    c = 0.5*(a+b); fc = f(c);
    fprintf('   n\t      a\t\t      b\t\t     c\t\t      f(c)');
    fprintf('\n-------\t-------------\t-------------\t-------------\t-------------\n');
    while ( (b-c) > tol && its < N)
        fprintf('   %d\t%1.8e\t%1.8e\t%1.8e\t%1.8e\n',its,a,b,c,fc);
        
        %if this is satisfied then we've found the root to machine precision
        if (abs(fc) < eps)
            break;
        end
        
        if(sign(fc)*sign(fb) < 0)
            a = c; fa = fc;
        else
            b = c; fb = fc;
        end
        c = 0.5*(a+b); fc = f(c);
        its = its+1;
    end
    fprintf('   %d\t%1.8e\t%1.8e\t%1.8e\t%1.8e\n',its,a,b,c,fc);

end
