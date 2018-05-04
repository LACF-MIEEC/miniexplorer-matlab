function parse_odometry( message )
%PARSE_ODOMETRY Parses odometry message and store data on
%MINIEXPLORER.odometry matrix.
%   Converts binary variables to MATLAB doubles an stores them.

global MINIEXPLORER

b1 = 1; X = double(typecast(uint8(message(b1:b1+3)), 'single'));
b1 = 5; Y = double(typecast(uint8(message(b1:b1+3)), 'single'));
b1 = 9; THETA = double(typecast(uint8(message(b1:b1+3)), 'single'));
b1 = 13; left_endoder = double(typecast(uint8(message(b1:b1+3)), 'int32'));
b1 = 17; right_encoder = double(typecast(uint8(message(b1:b1+3)), 'int32'));

variables = [ X, Y, THETA, left_endoder, right_encoder ];
MINIEXPLORER.odometry_data(MINIEXPLORER.index,:) = variables;
MINIEXPLORER.index = MINIEXPLORER.index + 1;

%disp([num2str(X), ' ', num2str(Y), ' ', num2str(THETA), ' ', num2str(left_endoder), ' ', num2str(right_encoder)])

end

