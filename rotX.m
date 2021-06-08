% rotX
%
%   R = rotX(theta)
%   Returns a rotation matrix describing a rotation about the X axis(theta in radians).
%   The rotation matrix about the X-axis, R, can be expressed as 
%   R = [1 0 0; 0 cos(theta) -sin(theta);0 -sin(theta) cos(theta)].
%    
%   Output
%   R = A rotation matrix about the X-axis.
%    
%   Input
%   theta = A rotation angle about the X-axis. 
%    
%   Name: Yunsik Jung
%   Student Number: 10843377
%   Course Number: MENG 544
%   Date: Sep. 30 2018
function R = rotX(theta)
    R = [1 0 0; 0 cos(theta) -sin(theta);0 sin(theta) cos(theta)];
end


