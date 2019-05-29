function [Hd] = filter
    Fs = 20;
    Fpass = 0;
    Fstop = 2;
    Dpass = 0.007501127785;
    Dstop = 3;
    flag  = 'scale';

    [N,Wn,BETA,TYPE] = kaiserord([Fpass Fstop]/(Fs/2), [1 0], [Dstop Dpass]);

    b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
    Hd = dfilt.dffir(b);
end
