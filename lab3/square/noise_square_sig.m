function [x_noise, sp, fplot] = noise_square_sig(x)
    global t tau fs;
    %зашумленный прямоугольный сигнал
    x_noise = awgn(x, 6);
    draw_img(t, x_noise);

    %спектр зашумленного прямоугольного сигнала
    sp    = abs(fft(x_noise));
    fplot = 0:1/tau:fs;
    draw_img(fplot, sp);
end
