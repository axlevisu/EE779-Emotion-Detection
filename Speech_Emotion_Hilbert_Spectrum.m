%% Speech Emotion Recognition Script using Hilbert Spectrum
[x,Fs] = audioread('./male_pani_a_8k.wav');
x=x';
M=length(x);

t=linspace(0,(M-1)/Fs, M);
figure(1); subplot(1,1,1);
plot(t, x, 'r');
axis tight;
title('Acoustic Speech Signal');

%% Find all the maxima & minima of the signal
max=zeros(1,1);
max_index=zeros(1,1);
min=zeros(1,1);
min_index=zeros(1   ,1);
j=0; k=0;

%%%%%Need to consider effect of noise on maxima & minima
for i=2:M-1
    if x(i)>=x(i-1) && x(i)>=x(i+1)
        j=j+1;
        max(j)=x(i); max_index(j)=i;
        
    elseif x(i)<=x(i-1) && x(i)<=x(i+1)
        k=k+1;
        min(k)=x(i); min_index(k)=i;       
    end
end

all_index=linspace(1,M, M);
Upper_Envelope=spline(max_index, max, all_index);
Lower_Envelope=spline(min_index, min, all_index);

figure(2); subplot(1,1,1);
plot(t, x, 'r'); hold on;
plot(t, Upper_Envelope, 'b'); hold on;
plot(t, Lower_Envelope, 'k');hold off;
axis tight;
title('Acoustic Speech Signal with upper & lower envelope');


m1=(Upper_Envelope+Lower_Envelope)/2;
h1=x-m1;
figure(3); subplot(1,1,1);
plot(t, h1, 'b');
axis tight;
title('h_1(t) After removing low frequency details from the signal');


%% Finding total number of extrema in h1(t)
max=zeros(1,1);
max_index=zeros(1,1);
min=zeros(1,1);
min_index=zeros(1,1);
j=0; k=0; l=0;

%%%%%Need to consider effect of noise on maxima & minima
for i=2:M-1
    if x(i)>x(i-1) && x(i)>x(i+1)
        j=j+1;
        max(j)=x(i); max_index(j)=i;     
    elseif x(i)<x(i-1) && x(i)<x(i+1)
        k=k+1;
        min(k)=x(i); min_index(k)=i;
    end
    if sign(x(i))*sign(x(i-1))<0
        l=l+1;
    end
end

disp(j)
disp(k)
disp(l)
    

