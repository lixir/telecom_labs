function [SNR_MSK, BER_SNR_MSK] = msk
    %MSK
    msg                      = randi([0 1], [1 256]);
    signal_modulation        = mskmod(msg, 16);
    signal_noise             = awgn(signal_modulation, 15);
    draw_scatterplot(signal_modulation);
    draw_scatterplot(signal_noise);
    errors                   = randerr(1, 256 * 16, 13);
    signal_modulation_errors = signal_modulation + errors;
    signal_demodulation      = mskdemod(signal_modulation_errors, 16);
    [numberMSK, ratioMSK]    = symerr(msg, signal_demodulation);

    BER_SNR_MSK = [];
    SNR_MSK     = [];
    for m = -15:1:15
        SNR     = m;
        ber_sum = 0;
        rep     = 100;
        for v = 1:rep
            signal_noise  = awgn(signal_modulation, SNR, 'measured');
            demod_MSK     = mskdemod(signal_noise, 16);
            [err, BER]    = biterr(msg, demod_MSK);
            ber_sum       = ber_sum + BER;
        end
        BER         = ber_sum ./ rep;
        BER_SNR_MSK = [BER_SNR_MSK, BER];
        SNR_MSK     = [SNR_MSK, SNR];
    end
end