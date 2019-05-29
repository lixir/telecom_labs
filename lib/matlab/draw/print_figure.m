function print_figure(input_figure)
    global counter;
    temp_str = sprintf('figures/figure_%d', counter);
    counter = counter + 1;
    print(input_figure, '-dpng', temp_str);
end
