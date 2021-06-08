%rotY 
%
%   R = rotY(theta) 
%   Returns a rotation matrix describing a rotation about the Y axis(theta in radians).
%   The rotation matrix about the Y-axis. R, can be expressed as 
%   R = [cos(theta) 0 sin(theta);0 1 0;-sin(theta) 0 cos(theta)].
%
%   Output
%   R = A rotation matrix about the Y-axis.
%
%   Input
%   theta = A rotation angle about the Y-axis. 
%
%   Name: Yunsik Jung
%   Student Number: 10843377
%   Course Number: MENG 544
%   Date: Sep. 30 2018
function R = rotY(theta)
    R = [cos(theta) 0 sin(theta);0 1 0;-sin(theta) 0 cos(theta)];
end