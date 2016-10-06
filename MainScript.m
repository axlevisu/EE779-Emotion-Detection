% Emotion Extration Main
[x,Fs] = audioread('./male_pani_a_8k.wav');
x=x';
M=length(x);
% Plot x
% t=linspace(0,(M-1)/Fs, M);
% figure(1); subplot(1,1,1);
% plot(t, x, 'r');
% axis tight;
% title('Acoustic Speech Signal');

imf = EMD(x);
