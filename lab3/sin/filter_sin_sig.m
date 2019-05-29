function filter_sin_sig(x_noise, sp, fplot)
    global t Hd;
    %синусоидальный сигнал после фильтрации
    filtered_signal = filter(Hd, x_noise);
    draw_img(t, x_noise, 'r', t, filtered_signal, 'b');

    %спектр синусоидального сигнала после фильтрации
    sp_filter = abs(fft(filtered_signal));
    draw_img(fplot, sp(1:length(fplot)), 'r', fplot, sp_filter(1:length(fplot)), 'b');
end
