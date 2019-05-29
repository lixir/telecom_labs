function [SNR_OQPSK, BER_SNR_OQPSK] = oqpsk
    %OQPSK
    msg                       =randi([0 3], [1 256]);
    signal_modulation         = oqpskmod(msg, pi/2);
    signal_noise              = awgn(signal_modulation, 15);
    draw_scatterplot(signal_modulation);
    draw_scatterplot(signal_noise);
    errors                    = randerr(1,513,13);
    signal_modulation_errors  = signal_modulation + errors;
    signal_demodulation       = oqpskdemod(signal_modulation_errors, pi/2);
    [numberOQPSK, ratioOQPSK] = symerr(msg, signal_demodulation);
    BER_SNR_OQPSK             = [];
    SNR_OQPSK                 = [];
    for m = -15:1:15
        SNR     = m;
        ber_sum = 0;
        rep     = 100;
        for v = 1:rep
            signal_noise = awgn(signal_modulation, SNR, 'measured');
            demod_OQPSK  = oqpskdemod(signal_noise, pi/2);
            [err, BER]   = biterr(msg, demod_OQPSK);
            ber_sum      = ber_sum + BER;
        end
        BER           = ber_sum ./ rep;
        BER_SNR_OQPSK = [BER_SNR_OQPSK, BER];
        SNR_OQPSK     = [SNR_OQPSK, SNR];
    end
end
