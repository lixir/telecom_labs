clc;
clear;

addpath('../lib/matlab/draw/');

global counter;
counter = 0;

global fc fs time x;
fc   = 250;
fs   = fc * 10; %частота
time = 0:1/fs:1; %время

x         = sig;
ini_phase = 0;
for M = 1:2
    amplitude_modulation(ini_phase, M);
end
amplitude_modulation_with_carrier_suppression;
single_band_modulation_and_signal_detection;
