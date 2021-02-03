%% Function to obtain 4-digit NACA airfoil

function y = NACA_function()

a = true;
    xxxx = 'Enter the 4-digit NACA XXXX airfoil you wish to analyze: ';
   	x = input(xxxx);
     
    while(a)
       if (x > 9999)
           fprintf('Invalid values for the profile. \n')
           x = input(xxxx);
       elseif (x < 1000)
           fprintf(' Invalid values for the profile. \n')
           x = input(xxxx);
       else
          a = false;
          y = x;
       end
       
    end
end

