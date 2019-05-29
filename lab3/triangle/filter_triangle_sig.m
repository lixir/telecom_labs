function filter_triangle_sig(x_noise)
    global Hd t;
    %треугольный сигнал после фильтрации
    filtered_signal = filter(Hd, x_noise);
    draw_img(t, x_noise, 'r', t, filtered_signal, 'b');

    %спектр треугольного сигнала после фильтрации
    sp_filter = abs(fft(filtered_signal, 2500));
    draw_img(1:2500, abs(fft(x_noise, 2500)), 'r', 1:2500, sp_filter, 'b');
end
