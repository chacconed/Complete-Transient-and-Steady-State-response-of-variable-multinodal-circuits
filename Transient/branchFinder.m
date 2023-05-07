function [vBranch_s, iBranch_s] = branchFinder(A, branchNumber, vNodal_s)
    syms s t
%% finding branch voltages and currents

    % s domain branch voltage
    vBranch_s = zeros(branchNumber, 1);
    vBranch_s = sym(vBranch_s);

    % s domain branch current
    iBranch_s = zeros(branchNumber, 1);
    iBranch_s = sym(iBranch_s);

    for i = 1:branchNumber
        % finding s domain branch voltages
        vBranch_s(i) = vNodal_s(A(i,4)) - vNodal_s(A(i,5));

        % finding s domain branch currents
        switch (double(A(i,1)))
            case 1
                % not needed. Current across voltage source will not be
                % considered. Kinda toilsome
            case 2
                % current source branch current is value of current source
                iBranch_s(i) = A(i,3);
            case 3
                % for resistor in s domain, i = v/R
                iBranch_s(i) = vBranch_s(i) / A(i,3);
            case 4
                % for inductor in s domain, i = v/sL + i(0)/s 
                iBranch_s(i) = vBranch_s(i) / (s * A(i,3)) + (A(i,6) / s);
            case 5
                % for capacitor in s domain, i = sCv + Cv(0)
                iBranch_s(i) = (vBranch_s(i)) * s * A(i,3) - A(i,3) * A(i,6);
        end
    end

end