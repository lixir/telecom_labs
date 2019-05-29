function use_matrix
    global msg;

    [h, g, n, k] = hammgen(3);
    m = msg * g
    m = rem (m, ones(1, n) .* 2)
    m(2) = not(m(2))
    synd = m * h';
    synd = rem(synd , ones(1, n - k) .* 2)
    stbl = syndtable(h);
    syndr_de = bi2de(synd, 'right-msb')
    z = stbl(syndr_de + 1, :)
    res = rem(z + m, 2)
end
