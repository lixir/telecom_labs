function [modulation] = frequency_modulation
    global x fc fs time;
    %Частотная модуляция
    dev = 25;
    modulation = fmmod(x, fc, fs, dev);
    draw_img(time, modulation);
    %Спектр моделируемого сигнала при частотной модуляции
    spectrum = fmdemod(modulation, fc, fs, dev);
    draw_img(time, spectrum);
end
