function [SNR_FSK, BER_SNR_FSK] = fsk
    %FSK
    msg                      = randi([0 1], [1 256]);
    M                        = 2;
    freqsep                  = 4;
    nsamp                    = 4;
    Fs                       = 32;
    signal_modulation        = fskmod(msg, M, freqsep,nsamp, Fs);
    signal_noise             = awgn(signal_modulation, 15);
    draw_scatterplot(signal_modulation);
    draw_scatterplot(signal_noise);
    errors                   = randerr(1, 256 * nsamp, 13);
    signal_modulation_errors = signal_modulation + errors;
    signal_demodulation      = fskdemod(signal_modulation_errors, M, freqsep, nsamp, Fs);
    [numberFSK, ratioFSK]    = symerr(msg, signal_demodulation);

    BER_SNR_FSK              = [];
    SNR_FSK                  = [];
    for m = -15:1:15
        SNR      = m;
        ber_sum  = 0;
        rep      = 100;
        for v = 1:rep
            signal_noise = awgn(signal_modulation, SNR, 'measured');
            demod_FSK    = fskdemod(signal_noise, M, freqsep, nsamp, Fs);
            [err, BER]   = biterr(msg, demod_FSK);
            ber_sum      = ber_sum + BER;
        end
        BER = ber_sum ./ rep;
        BER_SNR_FSK = [BER_SNR_FSK, BER];
        SNR_FSK = [SNR_FSK, SNR];
    end
end
