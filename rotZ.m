%rotZ 
%
%   R = rotZ(theta) 
%   Returns a rotation matrix describing a rotation about the Z axis(theta in radians).
%   The rotation matrix about the Z-axis. R, can be expressed as 
%   R = [cos(theta) -sin(theta) 0;sin(theta) cos(theta) 0;0 0 1].
%
%   Output
%   R = A rotation matrix about the Z-axis.
%
%   Input
%   theta = A rotation angle about the Z-axis. 
%
%   Name: Yunsik Jung
%   Student Number: 10843377
%   Course Number: MENG 544
%   Date: Sep. 30 2018
function R = rotZ(theta)
    R = [cos(theta) -sin(theta) 0;sin(theta) cos(theta) 0;0 0 1];
end