function [SNR_QAM, BER_SNR_QAM] = genqam
    %genQAM
    M                                 = 8;
    msg                               = randi([0 M-1], [1 256]);
    signal_modulation                 = genqammod(msg, exp(j * [0:M-1]));
    signal_noise                      = awgn(signal_modulation, 15);
    draw_scatterplot(signal_modulation);
    draw_scatterplot(signal_noise);
    errors                            = randerr(1, 256, 13);
    signal_modulation_errors          = signal_modulation + errors;
    signal_demodulation               = genqamdemod(signal_modulation_errors, exp(j * [0:M-1]));
    [numbergenQAM, ratiogenQAM]       = symerr(msg, signal_demodulation);
    [BITnumbergenQAM, BITratiogenQAM] = biterr(msg, signal_demodulation);
    BER_SNR_QAM                       = [];
    SNR_QAM                           = [];
    for m = -15:1:15
        SNR     = m;
        ber_sum = 0;
        rep     = 100;
        for v = 1:rep
            signal_noise  = awgn(signal_modulation, SNR, 'measured');
            demod_QAM     = genqamdemod(signal_noise, exp(j * [0:M-1]));
            [err, BER]    = biterr(msg, demod_QAM);
            ber_sum       = ber_sum + BER;
        end
        BER         = ber_sum ./ rep;
        BER_SNR_QAM = [BER_SNR_QAM, BER];
        SNR_QAM     = [SNR_QAM, SNR];
    end
end
