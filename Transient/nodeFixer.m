function [A, nodeNumber] = nodeFixer(Ao)

    %% Determining how many nodes

    nodeStates = zeros(1, 20);

    % places 1's on nodes that are named by the user
    for k = 1:length(Ao(:,4))
        nodeStates(Ao(k, 4)) = 1;
    end

    for k = 1:length(Ao(:,5))
        nodeStates(Ao(k, 5)) = 1;
    end

    % counts how many 1's in this vector
    nodeNumber = nnz(nodeStates);  


    % finding the highest node value our user inserted
    highestNodeValue = max([Ao(:, 4); Ao(:, 5)]);
    %% mapping node numbers with our easily accessible nodes that are in 
    %% chronological order

    mappedNodes = zeros(1,nodeNumber);
    count = 1;
    for k = 1:highestNodeValue
        if nodeStates(k) == 1
            mappedNodes(count) = k;
            count = count + 1;
        end
    end


    %% processing the user data to simplify node counts

    for k = 1:length(Ao(:,4))
        Ao(k, 4) = find(mappedNodes == Ao(k, 4));
    end

    for k = 1:length(Ao(:,5))
        Ao(k, 5) = find(mappedNodes == Ao(k, 5));
    end

    A = Ao;
end