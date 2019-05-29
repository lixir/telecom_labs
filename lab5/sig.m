function [x] = sig
    global time;
    w = 5;
    x = sin(2 * pi * w * time);
    draw_img(time, x);
end