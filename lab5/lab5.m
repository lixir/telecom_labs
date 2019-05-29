clc;
clear;

addpath('../lib/matlab/draw/');

global counter;
counter = 0;

global fc fs time x;
fc   = 250;
fs   = fc * 10; %частота
time = 0:1/fs:1; %время

x = sig;

modulation = phase_modulation;
demodulation(modulation);

modulation = frequency_modulation;
demodulation(modulation);
