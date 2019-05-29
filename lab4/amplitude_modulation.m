function amplitude_modulation(ini_phase, M)
    global x fc fs time;
    modulation = ammod(x, fc, fs, ini_phase, M);
    draw_img(time, modulation);
    %Спектр моделируемого сигнала
    spectrum = abs(fft(modulation));
    fplot = 0:1:fs;
    draw_img(fplot, spectrum);
end
