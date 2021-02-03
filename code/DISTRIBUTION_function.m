function [y, xi] = DISTRIBUTION_function()

a = true;
while (a)
    
    distribution = input('(a) Uniform\n(b) Full cosine\nDistribution for geometry discretization (choose from the above "a" or "b"): ','s');

        if (distribution == 'a' || distribution == 'A')
            % Uniform Distribution
            xi = linspace(0,1,N_panels);
            y = distribution;
            a = false;
            
        elseif (distribution == 'b' || distribution == 'B')
            % Full Cosene Distribution
            i = 1:N_panels;
            xi =(1/2)*(1 - cos((i - 1/N - 1)*pi));
            y = distribution;
            a = false;
            
        else 
            disp('Invalid asnwer. Please re-enter the answer [Uniform/Full Cosene] (a/b): ')
            y = distribution;
            
        end
end