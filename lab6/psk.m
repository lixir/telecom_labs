function [SNR_PSK, BER_SNR_PSK] = psk
    %PSK
    msg                         = randi([0 7], [1 256]);
    signal_modulation           = pskmod(msg, 8);
    signal_noise                = awgn(signal_modulation, 15);
    draw_scatterplot(signal_modulation);
    draw_scatterplot(signal_noise);
    errors                      = randerr(1, 256, 13);
    signal_modulation_errors    = signal_modulation+errors;
    signal_demodulation         = pskdemod(signal_modulation_errors, 8);
    [numberPSK, ratioPSK]       = symerr(msg, signal_demodulation);
    [BITnumberPSK, BITratioPSK] = biterr(msg, signal_demodulation);
    BER_SNR_PSK                 = [];
    SNR_PSK                     = [];

    for m = -15:1:15
        SNR     = m;
        ber_sum = 0;
        rep     = 100;
        for v = 1:rep
            signal_noise  = awgn(signal_modulation, SNR, 'measured');
            demod_PSK     = pskdemod(signal_noise, 8);
            [err, BER]    = biterr(msg, demod_PSK);
            ber_sum       = ber_sum + BER;
        end
        BER         = ber_sum./rep;
        BER_SNR_PSK = [BER_SNR_PSK, BER];
        SNR_PSK     = [SNR_PSK, SNR];
    end
end
