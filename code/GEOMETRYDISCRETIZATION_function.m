%% Geometry Discretization of the profile and saving normal vectors, vortex positions and data points
%Paremeters to obtain: vortex postitions(x,z), normal vectors (x,z), matrix of control points

function [nux_vector,nuz_vector,vx,vz,points_cp_matrix] = GEOMETRYDISCRETIZATION_function(naca_vector,N_panels,flap_existence,hinge,eta_rad)
    verif = true;
    while (verif)
        distribution = input('(a) Uniform\n(b) Full cosine\nDistribution for geometry discretization (choose from the above "a" or "b"): ','s');
        if (distribution == 'b')
            verif=false;
        elseif( distribution == 'a')
            verif = false;
        else 
            fprintf('Invalid asnwer. Please re-enter the answer [Uniform/Full Cosene] (a/b): ');
        end
    end
    
    t = (naca_vector(3)*10+naca_vector(4))/100;  % Obtention of the maximum thickness from profile designation
    p = naca_vector(2)/10;  % Obtention of the maximum camber position from profile designation
    f = naca_vector(1)/100;  % Obtention of the maximum camber from profile designation

    disp('Maximum thickness (t): ')
    disp(t)
    disp('Maximum camber position (p): ')
    disp(p)
    disp('Maximum Camber (f): ')
    disp(f)  
    
    N=N_panels+1; % Data points
    points_matrix = zeros (2,N);  % Matrix for saving data points
    points_cp_matrix = zeros (2,N_panels); % Matrix for saving data of Control Points
    x_vector = zeros (1,N);   % Vector for saving x data points 
    z_vector = zeros (1,N);   % Vector for saving z data points 

    i=1;
    while i<=N
        if (distribution=='a' && distribution=='A')
             % Uniform distribution;
             xi = (i-1)/(N_panels);
             x_vector(1,i) = xi; 
        else 
             % Full cosine function distribution;
             xi = (1/2)*(1 - cos((i - 1)/(N - 1)*pi));
             x_vector(1,i) = xi;
        end
        
        % Addition of Flap
        if (flap_existence == false)
            if(0<=xi) && (xi<=p)
                   % Function for camber line distribution from x=0 to x=p
                   zc1 = (f/(p^2))*(2*p*xi - xi^2);
                   z_vector(1,i) = zc1;
            elseif xi<=1
                   % Function for camber line distribution from x=p to x=1
                   zc2 = (f/((1-p)^2))*(1 - 2*p + 2*p*xi - xi^2);
                   z_vector(1,i) = zc2;
            else 
                   fprintf('Error in the camber line calculation');
            end
        
        else % flap_existence == true
            if(0<=xi) && (xi<=p)
                   % Function for camber line distribution from x=0 to x=p
                   zc1 = (f/(p^2))*(2*p*xi - xi^2);
                   z_vector(1,i) = zc1;    
              elseif xi>p && xi<=hinge
                   % Function for camber line distribution from x=p to x=hinge
                   zc2 = (f/((1-p)^2))*(1 - 2*p + 2*p*xi - xi^2);
                   z_vector(1,i) = zc2;   
              elseif xi>hinge && xi<=1
                   % Flap function for camber line distribution from x=hinge to x=1
                   zc3 = -(xi-hinge)*tan(eta_rad) + (f/((1-p)^2))*(1 - 2*p + 2*p*hinge - hinge^2);
                   z_vector(1,i) = zc3;
             end
        end
             i=i+1;
    end
    points_matrix = [x_vector;z_vector];
    % plot(x_vector,z_vector); % For verification purposes of the camber line

    %% Calculation of the numerical data for each panel

    % Vectors for saving x,z from each panel vector
    px_vector = zeros(1,N_panels);
    pz_vector = zeros(1,N_panels);
    % Vector for saving data points of the lenght of each panel
    panel_lenght = zeros(1,N_panels);
    % Vectors for saving x,y of the unitary vector of each panel
    ux_vector = zeros(1,N_panels);
    uz_vector = zeros(1,N_panels);
    % Vectors for saving x,y of the unitary normal vector to each panel
    nux_vector = zeros(1,N_panels);
    nuz_vector = zeros(1,N_panels);
    % Vectors for saving data points x,y of the position of the vortex
    vx = zeros(1,N_panels);
    vz = zeros(1,N_panels);
    
    a=1;
    for a = 1:N_panels
        % Calculating the panel vectors, its modulus and unitary vectors 
        px_vector(1,a) = x_vector(1,a+1) - x_vector(1,a);
        pz_vector(1,a) = z_vector(1,a+1) - z_vector(1,a);
        panel_lenght(1,a) = sqrt((px_vector(1,a))^2 + (pz_vector(1,a))^2);
        ux_vector(1,a) = px_vector(1,a) / panel_lenght(1,a);
        uz_vector(1,a) = pz_vector(1,a) / panel_lenght(1,a);
        
        % Calculating the unitary normal panel vectors
        nux_vector(1,a) = - uz_vector(1,a);
        nuz_vector(1,a) = ux_vector(1,a);
        % Calculating the vortex positions
        vx(1,a) = x_vector(1,a) + 0.25 * panel_lenght(1,a) * ux_vector(1,a);
        vz(1,a) = z_vector(1,a) + 0.25 * panel_lenght(1,a) * uz_vector(1,a);
        % Calculating the control points positions
        points_cp_matrix(1,a) = x_vector(1,a) + 0.75 * panel_lenght(1,a) * ux_vector(1,a);
        points_cp_matrix(2,a) = z_vector(1,a) + 0.75 * panel_lenght(1,a) * uz_vector(1,a);
    end

    %plot(x_vector,z_vector); % For verification purposes of the vortex positions
end