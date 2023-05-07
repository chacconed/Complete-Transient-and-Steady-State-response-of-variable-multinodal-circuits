%% Holy trinity of matlab
clc, close, clear all

%% Symbolic Variables
syms s t;
%% Assuming inputs for Transient Analysis

% Input / Processed input
% [<branch type> <type of source[applicable for sources only]> <branch value> <+ve> <-ve> <initial conditions / frequency of source>]
Ao = [2 1 10  1 2 0;
      3 1 30  2 1 0;
      3 1 6   2 1 0;
      3 1 5   2 3 0;
      4 1 2   3 1 12];

branchNumber = size(Ao, 1);

[A, nodeNumber] = nodeFixer(Ao);    % fixing node numbers for convenience

%% Finding the s domain nodal voltages and branch voltages after solving 
%% the s domain equivalent circuit

A = sym(A); % making A a symbolic matrix

A = sDomainer(A);   % converting circuit to s domain

equationMatrix = matrixFormer(A, nodeNumber);   % finding equation matrix  

vNodal_s = equationSolver(equationMatrix, nodeNumber);  % solves equation 
% matrix to obtain node voltages in s domain

% finding branch voltages and current in s domain
[vBranch_s, iBranch_s] = branchFinder(A, branchNumber, vNodal_s);

%% Transient Analysis of our given circuit

% Required inputs from the user
printStep = 1 / 200;  % each point gap
totalTime = 1;  % final time
timeDelay = 0;  % time of start

% converting from s domain to t domain
vNodal_t = ilaplace(vNodal_s);  % node voltages in t domain
vBranch_t = ilaplace(vBranch_s);    % branch voltages in t domain   
iBranch_t = ilaplace(iBranch_s);    % branch currents in t domain

% creating value list of node voltage, branch voltages and branch currents
[vNodal_vals, vBranch_vals, iBranch_vals, time] = valueListMaker(vNodal_t, vBranch_t, iBranch_t, timeDelay, printStep, totalTime);
syms s t;