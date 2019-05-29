function triangle_sig
    global amplitude frequency time fs tau

    %треугольный сигнал
    tau  = 5;
    T    = tau ;
    N    = 5;
    d    = (0:(N-1)) * T;
    fs   = 1/100;
    time = 0:fs:(N-1)*T; %время
    A    = 1;
    s    = A * pulstran(time, d, 'tripuls', tau);
    draw_img(time,s);
    sp1  = fft(s,2500);

    %спектр треугольного сигнала
    draw_img(abs(sp1));
    draw_spectrums(time,s);
end
