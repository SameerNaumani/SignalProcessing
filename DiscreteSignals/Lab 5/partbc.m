%% Part 2
%%
load handel.mat
filename = 'handel.wav';
audiowrite(filename,y,Fs);
clear y Fs
[y,fs] = audioread('handel.wav');
%%
% Question 1
%%
N0 = size(y,1);
T = 1 / fs;
T0 = linspace(0, 1, N0)'*T;
%% Question 2
figure;
plot(T0,y);
%% Question 3
Y = fft(y);
figure;
stem(Y);
%% Question 4
y_subsampled_2 = downsample(y,2);
N0_subsampled_2 = size(y_subsampled_2,1);
T0_subsampled_2 = linspace(0, 1, N0_subsampled_2)'*T;
%% Question 5
figure;
plot(T0_subsampled_2,y_subsampled_2);
%% Question 6
Y_subsampled_2 = fft(y_subsampled_2);
stem(Y_subsampled_2);
%% Question 7
sound(y);
sound(y_subsampled_2);
%% Question 8
y_subsampled_5 = downsample(y,5);
N0_subsampled_5 = size(y_subsampled_5,1);
T0_subsampled_5 = linspace(0, 1, N0_subsampled_5)'*T;
sound(y_subsampled_5);
%% Part 3
%% Filter Frequencies less than 2000 Hz and play sound
Y_filtered = Y;
for i = 0 : size(Y)
    if i > 2000
        Y_filtered(i + 1) = 0;
    end
end
figure;
subplot(2,1,1);
stem(Y_filtered);
subplot(2,1,2);
stem(ifft(Y_filtered));
sound(real(ifft(Y_filtered)));
%% Filter Frequencies between 16 and 256 Hz and play sound
Y_filtered = Y;
for i = 0 : size(Y)
    if i > 16 && i < 256
        Y_filtered(i + 1) = 0;
    end
end
figure;
subplot(2,1,1);
stem(Y_filtered);
subplot(2,1,2);
stem(ifft(Y_filtered));
% sound(real(ifft(Y_filtered)));
%% Amplify frequencies between 2048 and 16384 Hz by 25 and play sound
Y_filtered = Y;
for i = 0 : size(Y)
    if i > 2048 && i < 16384
        Y_filtered(i + 1) = Y_filtered(i + 1) * 1.25;
    end
end
figure;
subplot(2,1,1);
stem(Y_filtered);
subplot(2,1,2);
stem(ifft(Y_filtered));
sound(real(ifft(Y_filtered)));
