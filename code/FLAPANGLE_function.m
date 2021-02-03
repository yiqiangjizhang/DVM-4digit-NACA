function [degree,rad] = FLAPANGLE_function()

  xxxx = 'Enter the Flap Deflection angle (degrees): ';
  degree = input(xxxx);  
  
  if (abs(degree) > 360)
  
     degree = rem(degree,360);
  
     degree = abs(degree);
  
  end
  
  rad = deg2rad(degree);
       
end