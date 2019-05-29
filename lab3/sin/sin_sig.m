function [y] = sin_sig
    global t tau fs;

    a   = 3;  %амплитуда
    fc  = 2;  %частота

    %синусоидальный сигнал
    y = a * sin(2 * pi * fc * t);
    draw_img(y);

    %спектр синусоидального сигнала
    sp    = abs(fft(y));
    fplot = 0:1\tau:fs;
    draw_img(fplot, sp);
end
