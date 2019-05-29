function [x_noise, sp, fplot] = noise_sin_sig(y)
    global t tau fs;
    %зашумленный синусоидальный сигнал
    x_noise = awgn(y, 6);
    draw_img(t, x_noise);

    %спектр зашумленного синусоидального сигнала
    sp    = abs(fft(x_noise));
    fplot = 0:1/tau:fs;
    draw_img(fplot, sp);
end
