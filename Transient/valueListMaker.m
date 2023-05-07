function [vNodal_vals, vBranch_vals, iBranch_vals, time] = valueListMaker(vNodal_t, vBranch_t, iBranch_t, timeDelay, printStep, totalTime)
%% Making value lists for node voltages, branch voltages and branch 
%% currents
    syms s t
    time = timeDelay:printStep:totalTime;
    vNodal_vals = zeros(size(vNodal_t,1), length(time));
    vBranch_vals = zeros(size(vBranch_t,1), length(time));
    iBranch_vals = zeros(size(iBranch_t,1), length(time));

    tic
    for i = 1:length(time)
        t = time(i);
        vNodal_vals(:,i) = double(subs(vNodal_t));

        vBranch_vals(:,i) = double(subs(vBranch_t));

        iBranch_vals(:,i) = double(subs(iBranch_t));
        i;

    end
    toc
end