function begin_communication( COM_port )
%BEGIN_COMMUNICATION Starts communication with the robot on serial port
%COM_port
%   Opens the serial port and initializes a global variable to store the
%   data read from the robot.

global MINIEXPLORER
MINIEXPLORER.odom_num_vals = 5;
MINIEXPLORER.odometry_data = zeros(1e6, MINIEXPLORER.odom_num_vals);
MINIEXPLORER.index = 1;
MINIEXPLORER.serial_text = [];

%plot
%t = [fliplr(0:22.5:270) fliplr(292.5:22.5:337.5)];
%r = (1:16) .* exp(i * t * (pi/180));
%MINIEXPLORER.cpchart = compass(r);
%fim plot novo

MINIEXPLORER.serial_port = serial(COM_port,   ...
    'BaudRate',                 115200,     ...
    'InputBufferSize',          4000,       ...
    'Timeout',                  1,         ...
    'TimerPeriod',              0.2,         ...
    'TimerFcn',                 @process_message );

fopen(MINIEXPLORER.serial_port);

disp('Communication started.');

end

