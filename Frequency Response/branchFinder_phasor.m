function [vBranch_w, iBranch_w] = branchFinder_phasor(A, branchNumber, vNodal_w)
    syms w;
%% finding branch voltages and currents

    % s domain branch voltage
    vBranch_w = zeros(branchNumber, 1);
    vBranch_w = sym(vBranch_w);

    % s domain branch current
    iBranch_w = zeros(branchNumber, 1);
    iBranch_w = sym(iBranch_w);

    for j = 1:branchNumber
        % finding s domain branch voltages
        vBranch_w(j) = vNodal_w(A(j,4)) - vNodal_w(A(j,5));

        % finding s domain branch currents
        switch (double(A(j,1)))
            case 1
                % not needed. Current across voltage source will not be
                % considered. Kinda toilsome
            case 2
                % current source branch current is value of current source
                iBranch_w(j) = A(j,3);
            case 3
                % for resistor in s domain, i = v/R
                iBranch_w(j) = vBranch_w(j) / A(j,3);
            case 4
                % for inductor in s domain, i = v/jwL
                iBranch_w(j) = vBranch_w(j) / (i * w * A(j,3));
            case 5
                % for capacitor in s domain, i = jwCv
                iBranch_w(j) = vBranch_w(j) * i * w * A(j,3);
        end
    end

end