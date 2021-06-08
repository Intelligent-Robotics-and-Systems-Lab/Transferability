% function drawCoordinateAxes(H, label)
function drawCoordinateAxes(H, label)
    % pull out a translation vector 
    p = H(1:3,4);
    text(p(1), p(2), p(3), label);
    length = 0.2;
    ux = H*[length;0;0;1];
    uy = H*[0;length;0;1];
    uz = H*[0;0;length;1];
    withds = 1.5;
    line([p(1),ux(1)],[p(2),ux(2)], [p(3),ux(3)], 'Color', 'r', 'LineWidth',withds);
    line([p(1),uy(1)],[p(2),uy(2)], [p(3),uy(3)], 'Color', 'g', 'LineWidth',withds);
    line([p(1),uz(1)],[p(2),uz(2)], [p(3),uz(3)], 'Color', 'b', 'LineWidth',withds);
end