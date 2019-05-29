function [ ] = draw_spectrums(t, sig)
    temp_figure = figure;
    hold on
        %% Signal
        Fs = 8e3 ;
        FN = 2^nextpow2(length(t));
        %% Spectrum
        spc = fft(sig) ;
        subplot(2, 1, 1) ;
        %% Amplitude spectrum
        plot(abs(spc));
        grid
        subplot(2, 1, 2);
        %% Phase spectrum
        plot(atan(imag(spc)./real(spc)));
        grid
    hold off
    print_figure(temp_figure);
end
