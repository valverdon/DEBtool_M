%% warning_hex
% warns if parameter values are in the reasonable part of the parameter space of holometabolous insect model 

%%
function warning_std(par, chem)
% created 2015/06/05 by Goncalo Marques

%% Syntax
% <../warning_hex.m *warning_hex*> (par, chem)

%% Description
% Checks if parameter values are in the reasonable part of the parameter
%    space of the holometabolous insect model.
% Meant to be run after the estimation procedure
%
% Input
%
% * par: structure with parameters (see below)
% * chem: structure with biochemical parameters


  % unpack par, chem
  v2struct(par); v2struct(chem);

  cpar = parscomp_st(par, chem);
  v2struct(cpar);

  if kap_G >= mu_V / mu_E; % can only occur if y_VE > 1, meaning that CO2 is consumed
    fprintf('kap_G >= mu_V / mu_E, which is not allowed if CO2 production occurs in association with growth. \n');
  end

  if kap_X >= mu_X / mu_E; % can only occur if y_XE > 1, meaning that CO2 is consumed
    fprintf('kap_X >= mu_X / mu_E, which is not allowed if CO2 production occurs in association with assimilation. \n');
  end

  if exist('kap_P', 'var')
    if kap_P >= mu_X / mu_P; % can only occur if y_XE > 1, meaning that CO2 is consumed
      fprintf('kap_P >= mu_X / mu_P, which is not allowed if CO2 production occurs in association with assimilation. \n');
    end
  end
  