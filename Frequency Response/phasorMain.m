function [vNodal_vals, vBranch_vals, iBranch_vals, freq] = phasorMain(Ao, startFreq, endFreq, pointsPer)
    %% Symbolic Variables
    syms w;
    %% Assuming inputs for Frequency Analysis

    % Input / Processed input
    % [<branch type> <real coefficient> <imaginary coefficient> <+ve> <-ve>]
    %sources are in phasor form, magnitude given by complex number

    for j = 1:size(Ao,1)
        if Ao(j,1) == 1 || Ao(j,1) == 2
            Ao(j,3) = Ao(j,2) + i * Ao(j,3);
        end
    end

    branchNumber = size(Ao, 1);

    [A, nodeNumber] = nodeFixer(Ao);    % fixing node numbers for convenience

    %% Finding the nodal voltages and branch voltages after solving 
    %% the phasor equivalent circuit

    A = sym(A); % making A a symbolic matrix

    equationMatrix = matrixFormer_phasor(A, nodeNumber);   % finding equation matrix  

    vNodal_w = equationSolver_phasor(equationMatrix, nodeNumber);  % solves equation 
    % matrix to obtain node voltages

    % finding branch voltages and current
    [vBranch_w, iBranch_w] = branchFinder_phasor(A, branchNumber, vNodal_w);

    %% Frequency Analysis of our given circuit

    % required inputs from the user, always plotted in decades

    startFreq = 1; % user defined
    endFreq = 1e6;  % user defined
    pointsPer = 20; % points per interval of log axis for freq response

    if startFreq == endFreq
        flag = 1;
    else
        flag = 0;
    end

    switch (flag)
        case 1
            freq = startFreq;
            w = 2 * pi * freq;
            vNodal_vals = double(subs(vNodal_w));
            vBranch_vals = double(subs(vBranch_w));
            iBranch_vals = double(subs(iBranch_w));
        case 0
            k_start = 0;
            while 1
                if (10^k_start) < startFreq;
                    k_start = k_start + 1;
                else
                    break;
                end
            end

            k_end = 0;
            while 1
                if (10^k_end) < endFreq;
                    k_end = k_end + 1;
                else
                    break;
                end
            end

            N = (k_end - k_start) * 10; % number of points from start to end frequency

            freq = logspace(k_start, k_end, N);
            vNodal_vals = zeros(nodeNumber, length(freq));
            vBranch_vals = zeros(nodeNumber, length(freq));
            iBranch_vals = zeros(nodeNumber, length(freq));
            tic
            for j = 1:length(freq)
                w = 2*pi*freq(j);
                vNodal_vals(:,j) = double(subs(vNodal_w));
                vBranch_vals(:,j) = double(subs(vBranch_w));
                iBranch_vals(:,j) = double(subs(iBranch_w));
            end     
            toc
    end
end
        