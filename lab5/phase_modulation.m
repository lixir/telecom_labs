function [modulation] = phase_modulation
    global x fc fs time;
    modulation = pmmod(x, fc, fs, pi/2);
    draw_img(time, modulation);

    spectrum = pmdemod(modulation, fc, fs, pi/2);
    draw_img(time, spectrum);
end
