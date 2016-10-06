function IMF = EMD(x)
    c   = x(:)';
%   SD predetermined value
    pre_det = 0.1;
    IMF = [];
    M=length(x);
    while 1
        h = c;
        sd =1;
        %         Stops when i finds the residue
        if length(findpeaks(h))*length(findpeaks(-h)) ==0, break;end
        while sd > pre_det 
            max_index = find_peaks(h);
            min_index = find_peaks(-h);
            Upper_Envelope=spline(max_index, h(max_index), 1:M);
            Lower_Envelope=spline(min_index, h(min_index), 1:M);

            m=(Upper_Envelope+Lower_Envelope)/2;
            eps = 0.0000001;
            sd = sum(m.^2)/(eps +sum(h.^2));
%             display(sd)
            h=h-m;
        end

        IMF =[IMF ;h];
%         IMF{end +1} = h;
        c = c-h;    
    end
    IMF =[IMF ;h];
end