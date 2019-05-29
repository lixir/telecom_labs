function [s] = triangle_sig
    global t tau fs;
    %треугольный сигнал
    T = tau ;
    tau = 5;
    fs  = 1/100;
    N = 5;
    t   = 0:fs:(N-1)*T; %время
    d = (0:(N-1))*T;
    A = 1;
    s = A * pulstran(t, d, 'tripuls', tau);
    draw_img(t, s);
    sp = fft(s, 2500);
    draw_img(abs(sp));
end
