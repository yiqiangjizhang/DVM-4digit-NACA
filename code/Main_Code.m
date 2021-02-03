%% HOMEWORK I - Proyecto de Aerodinámica

%%{ ANALYSIS AND COMPUTATION OF AERODYNAMICPARAMETERS FOR NACA 4-DIGIT
%AIRFOILS WITHTRAILING EDGE FLAPS USING THE DISCRETE VORTEXMETHOD(DVM)}


%% PROGRAM CODE

clc;
clear all;
close all;

% Printing out message
fprintf('ANALYSIS AND COMPUTATION OF AERODYNAMIC PARAMETERS FOR NACA 4-DIGIT \n');
fprintf('AIRFOILS WITH TRAILING EDGE FLAPS USING THE DISCRETE VORTEX METHOD(DVM) \n');
fprintf('\n');
fprintf('\n');

% Asking the NACA Airfoil Parameters - Airfoil Designation
naca = NACA_function();
naca_vector=num2str(naca)-'0'; % Convert input airfoil XXXX to a vector [X X X X]

% Asking for Angle Attack of Analysis
[angle_attack_deg,angle_attack_rad] = ATANGLE_function();

% Asking for Number of Panels
N_panels = PANEL_function();

% Additional Flap 
[flap_existence,hinge,eta,eta_rad] = FLAP_function();

% Asking for Geometry Discretization distribution of Panels
[normal_x,normal_z,vortex_x,vortex_z,points_cp_matrix]=GEOMETRYDISCRETIZATION_function(naca_vector,N_panels,flap_existence,hinge,eta_rad);

%% Final Airfoil Designation and Parameters

fprintf('The following parameters have been processed: \n');
fprintf('\n');

disp('NACA Airfoil ')
disp(naca)

disp('Angle of Attack (º) : ')
disp(angle_attack_deg)

disp('Number of Panels (N_panels: ') 
disp(N_panels)

disp('Flap Existence: ')
disp(flap_existence)

disp('Flap Hinge Position: ')
disp(hinge)

disp('Flap Deflection angle (º): ')
disp(eta)

%% Developing Circulation Matrix


