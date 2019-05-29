function square_sig
    global amplitude frequency time fs tau

    %прямоугольный сигнал
    duty = 50;
    amp = 1;
    x = amp*square(2*pi*time, duty);
    draw_img(time,x);

    %спектр прямоугольного сигнала
    sp = abs(fft(x));
    draw_img(time, sp);
    draw_spectrums(time, x)
end