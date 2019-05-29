function [x_noise] = noise_triangle_sig(s)
    global t;
    %зашумленный треугольынй сигнал
    x_noise = awgn(s, 6);
    draw_img(t, x_noise);

    %спектр зашумленного треугольного сигнала
    draw_img(abs(fft(x_noise, 2500)));
end
