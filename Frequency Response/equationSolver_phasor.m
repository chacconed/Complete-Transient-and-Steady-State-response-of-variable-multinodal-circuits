function vNodal_w = equationSolver_phasor(equationMatrix, nodeNumber)

    rowEchelon = rref(equationMatrix);  % complex matrix has been simplified

    rowEchelon = rowEchelon(1:nodeNumber-1,:);  % disregarding zero rows

    vNodal_w = rowEchelon(:,nodeNumber);   % node voltages

    vNodal_w = [0; vNodal_w];   % zero vector added as ground node voltage

end