function vNodal_s = equationSolver(equationMatrix, nodeNumber)

    rowEchelon = rref(equationMatrix);  % s domain matrix has been simplified

    rowEchelon = rowEchelon(1:nodeNumber-1,:);  % disregarding zero rows

    vNodal_s = rowEchelon(:,nodeNumber);   % node voltages in s domain

    vNodal_s = [0; vNodal_s];   % zero vector added as ground node voltage

end