function A = sDomainer(Ao)
    syms s t;
    %% Converting source values to s domain
    for k = 1:size(Ao,1)
        % if current or voltage source, change their representation from
        % time domain to s domain
        if Ao(k,1) == 1 || Ao(k, 1) == 2
            Ao(k,3) = laplace(Ao(k,3), t, s);
        end
    end
    
    A = Ao;

end