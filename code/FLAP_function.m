%% Function to obtain FLAP parameters

function [y, hinge, eta,eta_rad] = FLAP_function()

a = true;

    while (a)
        flap_existence = input('Include Flap? [Answer (y/n) ','s');
            
            if (flap_existence == 'y' || flap_existence == 'Y')
                % Asking for Flap Hinge Location
                hinge = HINGE_function();
                % Asking for Flap Deflection Angle
                [eta,eta_rad] = FLAPANGLE_function();
                
                a = false;
                flap_existence = true;
                y = flap_existence;

            elseif (flap_existence == 'n' || flap_existence == 'N')
                % Flap parameters == 0
                a = false;
                flap_existence = false;
                y = flap_existence;
                hinge = 0;
                eta = 0;
                eta_rad = 0;
            else 
                fprintf('Invalid answer. Please re-enter the answer (y/n): ')
            end
    end
end