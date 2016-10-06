function [ output ] = is_IMF( x )
    x = x(:)';
    N  = length(x);
    u1 = sum(x(1:N-1).*x(2:N) < 0);
    u2 = length(find_peaks(x))+length(find_peaks(-x));
%     the number of extrema and the number of zero-crossings 
%     must either equal or differ at most by one
    if abs(u1-u2) > 1, output = 0;
    else output = 1; end


end

