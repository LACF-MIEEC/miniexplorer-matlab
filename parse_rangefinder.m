function parse_rangefinder( message )
%PARSE_ODOMETRY Parses odometry message and store data on
%MINIEXPLORER.odometry matrix.
%   Converts binary variables to MATLAB doubles an stores them.

global MINIEXPLORER

measurements = zeros(1,16);

for k=1:16
    measurements(k) = double(typecast(uint8(message(k*2-1:k*2)), 'uint16'));

    % Discards measurements above 1270 mm.
    if measurements(k) >= 1270
        measurements(k) = 1;
    end
end

% Initialization of compass chart with axis to 1200 mm.
chart_init = eig(randn(20,20));
hchart = compass(1200 * ones(size(chart_init)));
set(hchart, 'Visible', 'off')
hold on

% Conversion of measurements to compass chart (polar) a plot.
t = [fliplr(0:22.5:270) fliplr(292.5:22.5:337.5)];
r = measurements .* exp(i * t * (pi/180));
compass(r)

hold off
drawnow

%disp(measurements);

end
