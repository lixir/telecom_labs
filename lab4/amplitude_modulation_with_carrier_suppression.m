function amplitude_modulation_with_carrier_suppression
    global x fc fs time;
    modulation = ammod(x, fc, fs);
    draw_img(time, modulation);
    %спектр
    fplot = 0:1:fs;
    spectrum = abs(fft(modulation));
    draw_img(fplot, spectrum);
end
