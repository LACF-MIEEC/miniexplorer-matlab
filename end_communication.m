function end_communication()
%END_COMMUNICATION Terminates de thee communication with the robot
%   Closes the serial port.

global MINIEXPLORER

fclose(MINIEXPLORER.serial_port);
disp('Communication finished.');

end

