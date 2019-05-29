function dec_enc(is_two)
    global msg;
    % using encode/decode
    code = encode(msg, 7, 4)
    code_error = code;
    code_error(3) = not(code_error(3))
    if is_two
        code_error(4) = not(code_error(4))
    end
    dec = decode(code_error, 7, 4)
    if dec == msg
        disp('SUCCESS');
    else disp('ERROR');
    end
end
