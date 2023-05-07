function [vNodal_vals, vBranch_vals, iBranch_vals, time] = transientMain(Ao, printStep, totalTime, timeDelay)
    %% Symbolic Variables
    syms s t;
    %% Assuming inputs for Transient Analysis
    % 1 == sin
    % 2 == cos

    % Input / Processed input
    % [<branch type> <type of sources, applicable for sources only> <branch value> <+ve> <-ve> <initial conditions / frequency>]

    Ao = sym(Ao);
    for i = 1:size(Ao, 1)
        if Ao(i,1) == 1 || Ao(i,1) == 2
            if Ao(i,6) == 0
                continue;
            else
                ang = 2 * pi * Ao(i,6);
                switch (double(Ao(i,2)))
                    case 1
                        Ao(i,3) = Ao(i,3) * sin(ang * t);
                    case 2
                        Ao(i,3) = Ao(i,3) * cos(ang * t); 
                end
            end
        end
    end

    
    branchNumber = size(Ao, 1);
    [A, nodeNumber] = nodeFixer(Ao);    % fixing node numbers for convenience
    
    A

    %% Finding the s domain nodal voltages and branch voltages after solving 
    %% the s domain equivalent circuit

    A = sym(A); % making A a symbolic matrix

    A = sDomainer(A);   % converting circuit to s domain

    equationMatrix = matrixFormer(A, nodeNumber);   % finding equation matrix  

    vNodal_s = equationSolver(equationMatrix, nodeNumber);  % solves equation 
    % matrix to obtain node voltages in s domain
    
    disp('equationsolver done')
    % finding branch voltages and current in s domain
    [vBranch_s, iBranch_s] = branchFinder(A, branchNumber, vNodal_s);

    %% Transient Analysis of our given circuit
    % converting from s domain to t domain
    vNodal_t = ilaplace(vNodal_s);  % node voltages in t domain
    vBranch_t = ilaplace(vBranch_s);    % branch voltages in t domain   
    iBranch_t = ilaplace(iBranch_s);    % branch currents in t domain

    % creating value list of node voltage, branch voltages and branch currents
    [vNodal_vals, vBranch_vals, iBranch_vals, time] = valueListMaker(vNodal_t, vBranch_t, iBranch_t, timeDelay, printStep, totalTime);
    syms s t;
end