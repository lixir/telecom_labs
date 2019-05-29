function normal_correlation
    global signal sin_signal;
    tic;
    [cross, lags] = xcorr(signal, sin_signal);
    time = toc;

    draw_stem(lags, cross);
    disp('Normal correlation: ');
    disp(time);
end