clc;
clear;

addpath('../lib/matlab/draw/');

addpath('sin/');
addpath('square/');
addpath('triangle/');

global counter;
counter = 0;

global Hd;
[Hd] = filter;

clc;
global fs tau t;
fs  = 100;
tau = 2 * pi;
t   = 0:1/fs:tau; %время

[y]                  = sin_sig;
[x_noise, sp, fplot] = noise_sin_sig(y);
filter_sin_sig(x_noise, sp, fplot)

[x]                  = square_sig;
[x_noise, sp, fplot] = noise_square_sig(x);
filter_square_sig(x_noise, sp, fplot);

[s]       = triangle_sig;
[x_noise] = noise_triangle_sig(s);
filter_triangle_sig(x_noise);
