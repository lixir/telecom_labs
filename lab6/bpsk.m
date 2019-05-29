function [SNR_BPSK, BER_SNR_BPSK] = bpsk
    %BPSK
    msg                           = randi([0 1], [1 256]);
    signal_modulation             = pskmod(msg, 2);
    signal_noise                  = awgn(signal_modulation, 15);
    draw_scatterplot(signal_modulation);
    draw_scatterplot(signal_noise);
    errors                        = randerr(1, 256, 13);
    signal_modulation_errors      = (signal_modulation + errors);
    signal_demodulation           = pskdemod(signal_modulation_errors, 2);
    [numberBPSK, ratioBPSK]       = symerr(msg, signal_demodulation);
    [BITnumberBPSK, BITratioBPSK] = biterr(msg, signal_demodulation);
    BER_SNR_BPSK                  = [];
    SNR_BPSK                      = [];
    for m = -15:1:15
        SNR     = m;
        ber_sum = 0;
        rep     = 100;
        for v = 1:rep
            signal_noise = awgn(signal_modulation, SNR, 'measured');
            demod_BPSK   = pskdemod(signal_noise, 2);
            [err, BER]   = biterr(msg, demod_BPSK);
            ber_sum      = ber_sum + BER;
        end
        BER          = ber_sum./rep;
        BER_SNR_BPSK = [BER_SNR_BPSK, BER];
        SNR_BPSK     = [SNR_BPSK, SNR];
    end
end
