function fast_correlation
    global signal sin_signal;
    tic;
    fast_corr = ifft(fft(signal).*conj(fft(sin_signal, length(signal))));
    time = toc;

    draw_stem(fast_corr);
    disp('Fast correlation: ');
    disp(time);
end