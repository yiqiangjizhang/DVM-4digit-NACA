%% Function to get the angle of attack of the NACA airfoil in degrees and radians 

function [degree,rad] = ATANGLE_function()
  xxxx = 'Enter the angle of attack (degrees: '; % The angle must not exceed 15º due to small angle attack hypothesis
  degree = input(xxxx);  
  
  if (abs(degree) > 360)
     degree = rem(degree,360);
     degree = abs(degree);
  end
  
  rad = deg2rad(degree);
end
