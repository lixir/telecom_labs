clc;
close all;

addpath('../lib/matlab/draw/');

global counter;
counter = 0;

[SNR_BPSK , BER_SNR_BPSK ] = bpsk
[SNR_PSK  , BER_SNR_PSK  ] = psk
[SNR_OQPSK, BER_SNR_OQPSK] = oqpsk
[SNR_QAM  , BER_SNR_QAM  ] = genqam
[SNR_MSK  , BER_SNR_MSK  ] = msk
[SNR_FSK  , BER_SNR_FSK  ] = fsk

temp_figure = figure
    hold on
        plot(SNR_BPSK , BER_SNR_BPSK , 'g');
        plot(SNR_PSK  , BER_SNR_PSK  , 'r');
        plot(SNR_OQPSK, BER_SNR_OQPSK, 'k');
        plot(SNR_QAM  , BER_SNR_QAM  , 'g');
        plot(SNR_MSK  , BER_SNR_MSK  , 'b');
        plot(SNR_FSK  , BER_SNR_FSK  , 'm');
    hold off
    xlabel('SNR');
    ylabel('Вероятность ошибки');
    legend('BPSK', 'PSK', 'OQPSK', 'QAM', 'MSK', 'FSK');
    title ('Зависимость SNR от ошибки');
print_figure(temp_figure);
