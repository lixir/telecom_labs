function draw_stem(varargin)
    temp_figure = figure;
    hold on
        stem(varargin{:});
        grid
    hold off
    print_figure(temp_figure);
end
