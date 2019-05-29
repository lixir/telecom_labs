function cycle_code
    global msg;
    % cycle code %
    n = 7; k = 4;
    pol = cyclpoly (n, k, 'max')
    [h, g] = cyclgen(7, pol);
    code = msg * g;
    code = rem(code, ones(1, n) .* 2)

    code(2) = not(code(2))

    synd = code * h'

    synd = rem(synd , ones(1, n - k) .* 2)

    stbl = syndtable(h)

    syndr_de = bi2de(synd, 'right-msb')
    z = stbl(syndr_de + 1, :)
    rez = rem(z + code, 2)
end
