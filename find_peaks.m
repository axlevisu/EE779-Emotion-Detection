function [ output ] = find_peaks( x )
    x = x(:)';
    M = length(x);
%     max=zeros(1,1);
    output =zeros(1,1);
    j = 0;
    for i=2:M-1
        if x(i)>=x(i-1) && x(i)>=x(i+1)
            j=j+1;
%             max(j)=x(i); 
            output(j)=i;
        end
    end

end

