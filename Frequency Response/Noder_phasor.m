function [nodeVector, equationMatrix] = Noder_phasor( thisEquationMatrix, A, VoltageOnly, nodeNumber, ithNode, branchBaad)
    syms w;
    %% Variable Initialization
    % taking only branches that are connected to ith node
    tempMat = A(A(:,4) == ithNode | A(:,5) == ithNode,:);
    
    % cancelling out the branch we exclude from nodal analysis of ith node
    count = 1;
    while 1
        if isequaln(tempMat(count,:), branchBaad) == 1
            tempMat(count,:) = [];
            count = count - 1;
        end
        count = count + 1;
        if count == size(tempMat, 1);
            break;
        end
    end
        
    
    % vector of coefficients for ith node
    nodeVector = zeros(1, nodeNumber);
    nodeVector = sym(nodeVector);
    
    % vector for supernode
    arbNodeVector = nodeVector;
    
    % equation matrix continues to be the same as obtained equation matrix
    equationMatrix = thisEquationMatrix;
    
    %% finding coefficients of node voltages for ith node
    
    for j = 2:nodeNumber
        % finding coefficients of jth column of the ith node
        if j ~= ithNode
            for k = 1:size(tempMat, 1)
                if tempMat(k, 4) == sym(j) || tempMat(k, 5) == sym(j)
                    switch (double(tempMat(k, 1)))
                        case 1
                            % not needed

                        case 2
                            % not needed

                        case 3
                            % for resistor
                            nodeVector(j-1) = nodeVector(j-1) - (1 / tempMat(k,3));

                        case 4
                            % for inductor
                            nodeVector(j-1) = nodeVector(j-1) - (1 / (i * w * tempMat(k,3)));

                        case 5
                            % for capacitor
                            nodeVector(j-1) = nodeVector(j-1) - (i * w * tempMat(k,3));   
                    end
                end
            end
        else
            % finding ith column coefficients, the diagonal element and
            % also the excitation values due to sources connected to ith
            % node, if any.
            for k = 1:size(tempMat, 1)
                switch (double(tempMat(k, 1)))
                    case 1
                        % for voltage source
                        % supernode evaluation
                        if tempMat(k,4) == sym(ithNode)
                            arbNodeVector(ithNode-1) = 1;
                            xNode = tempMat(k,5);
                            arbNodeVector(xNode-1) = -1;
                            arbNodeVector(end) = tempMat(k,3);
                        else
                            arbNodeVector(ithNode-1) = -1;
                            xNode = tempMat(k,4);
                            arbNodeVector(xNode-1) = 1;
                            arbNodeVector(end) = tempMat(k,3);
                        end
                        
                        % updating equation matrix with the equation
                        % obtained due to connected voltage source
                        equationMatrix = [equationMatrix; arbNodeVector];
                        
                        % cancelling out voltage source from supernode
                        % vector calculation
                        cancelBranch = tempMat(k,:);
                        
                        % finding supernodeVector and equationMatrix by
                        % analyzing our supernode, that is, by analyzing
                        % the node connected to voltage source besides the
                        % ith node and adding that vector with our current
                        % node vector
                        [superNodeVector, equationMatrix] = Noder(equationMatrix, A, VoltageOnly, nodeNumber, xNode, cancelBranch);
                        nodeVector = nodeVector + superNodeVector;
                        
                    case 2
                        % for current source
                        if tempMat(k,4) == sym(j)
                            nodeVector(end) = nodeVector(end) - tempMat(k,3);
                        else
                            nodeVector(end) = nodeVector(end) + tempMat(k,3);
                        end

                    case 3
                        % for resistor
                        nodeVector(j-1) = nodeVector(j-1) + (1 / tempMat(k,3));

                    case 4
                        % for inductor
                        nodeVector(j-1) = nodeVector(j-1) + (1 / (i * w * tempMat(k,3)));
                        
                    case 5
                        % for capacitor
                        nodeVector(j-1) = nodeVector(j-1) + (i * w * tempMat(k,3));
                        
                end
            end     
        end

    end

end

