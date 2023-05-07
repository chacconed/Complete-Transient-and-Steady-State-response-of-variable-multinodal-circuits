function equationMatrix = matrixFormer_phasor(A, nodeNumber)
    syms w;
%% Variable Declaration
    
    % equation Matrix that holds all info about the system of equations
    equationMatrix = zeros(nodeNumber-1, nodeNumber);
    equationMatrix = sym(equationMatrix);

    % gathering the branches that are voltage sources only
    VoltageOnly = A(A(:,1) == 1,:);

%% Processing the nodes
    for k = 2:nodeNumber
        % nodeVector that stores coefficients of node voltages for a 
        % particular node 
        nodeVector = zeros(1, nodeNumber);
        nodeVector = sym(nodeVector);
        
        cancelBranch = zeros(1, nodeNumber);
        cancelBranch = sym(cancelBranch);
        
        % branches that are connected to this node and are voltage sources
        presentNodeVoltageOnly = VoltageOnly(VoltageOnly(:,4) == k | VoltageOnly(:,5) == k,:);
        
        % seeing if a voltage source connected to this node is grounded
        isGrounded = presentNodeVoltageOnly(presentNodeVoltageOnly(:,4) == 1 | presentNodeVoltageOnly(:,5) == 1,:);
        
        if(~isempty(isGrounded))  
            % nodes with grounded voltage sources will always have a 
            % constant node voltage value defined by the source value
            nodeVector(k-1) = 1;
            nodeVector(end) = isGrounded(3);
        else
            % otherwise, nodal analysis of that node is necessary
            [nodeVector, equationMatrix] = Noder_phasor(equationMatrix, A, VoltageOnly, nodeNumber, k, cancelBranch);
        end
        
        % assigning obtained nodevectors into our equation matrix
        equationMatrix(k - 1,:) = nodeVector;

    end

end