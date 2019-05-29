function single_band_modulation_and_signal_detection
    global x fc fs time;
    modulation = ssbmod(x, fc, fs);
    draw_img(time, modulation);

    sig = ssbdemod(modulation, fc, fs);
    draw_img(time, sig);
end
