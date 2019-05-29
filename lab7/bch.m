function bch
    global msg;
    % BCH codes %
    code_p = comm.BCHEncoder(7, 4);
    dec_p = comm.BCHDecoder(7, 4);
    tmp = msg';
    code = step(code_p, tmp(:))'

    code(2) = not(code(2))
    decode = step(dec_p, code')'
end
