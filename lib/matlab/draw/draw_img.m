function draw_img(varargin)
    temp_figure = figure;
    hold on
        plot(varargin{:});
        grid
    hold off
    print_figure(temp_figure);
end
