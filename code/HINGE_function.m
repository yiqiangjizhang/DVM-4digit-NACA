function y = HINGE_function()

a = true;

    while(a)
     xxxx = 'Enter the hinge axis position of the Flap (from TE): ';
     x = input(xxxx);
       if (x > 1)
           disp('Invalid values for the aifoil. Please re-enter the Flap Hinge location: ')
           
       elseif (x < 0)
           disp('Invalid values for the aifoil. Please re-enter the Flap Hinge location: ')
            
       else
          a = false;
          y = x;
              
      end
    end
end
