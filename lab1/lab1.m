clc;
clear;

addpath('signals/');
addpath('correlations/');
addpath('../lib/matlab/draw/');

global counter;
counter = 0;

global fs amplitude frequency tau time;
fs        = 100;
amplitude = 3;   %амплитуда
frequency = 2;   %циклиеская частота сигнала
tau       = 2*pi;
time      = 0:1/fs:tau; %время

sin_sig;
square_sig;
triangle_sig;

global signal sin_signal;
signal     = [ 0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0 ];
sin_signal = [ 1 0 1 ];

normal_correlation;
fast_correlation;
