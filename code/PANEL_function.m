%% Function to obtain the number of panels for the DVM analysis

function y = PANEL_function()

a = true;

    while(a)
        xxxx = 'Insert the number of panels to analyze: '; % The number of panels must be high to get accurate results
        x = input(xxxx);
        x = floor(x);

        if (x < 1)
            fprintf('Invalid number of panels. \n');
        elseif (x < 10)
            fprintf('Discrete Vortex Method may not provide accurate results for this low number of panels (Recomendation: N_panels > 10). \n');
        else
            a = false;
            y = x;
        end
    end
end
