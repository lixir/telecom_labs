function demodulation(modulation)
    global time;
    spectrum = abs(fft(modulation));
    draw_img(time, spectrum);
end
