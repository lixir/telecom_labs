function sin_sig
    global amplitude frequency time fs tau
    %cинусоидальный сигнал
    y = amplitude * sin(2 * pi * frequency * time);
    draw_img(time * fs, y)

    %спектр синусоидального сигнала
    sp = abs(fft(y));
    fplot = 0:1/tau:fs;
    draw_img(fplot, sp)
    draw_spectrums(time, y)
end