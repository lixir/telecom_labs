function [x] = square_sig
    global t;
    %прямоугольный сигнал
    duty = 50;
    amp  = 1;
    x    = amp * square(2 * pi * t, duty);
    draw_img(t, x);

    %спектр прямоугольного сигнала
    sp = abs(fft(x));
    draw_img(t, sp);
end
