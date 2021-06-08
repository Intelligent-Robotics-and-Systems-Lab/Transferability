%% linspace_angles

function thetas = linspace_angles(min,max)
    % calculate number of points based on min, max

    diff = max - min;
    term = 10;
    num_pts = diff/term;
    
    % check the remainer
    remained = rem(diff, term);
    if remained ~= 0
        num_pts = round(num_pts);
    end
    
    thetas = linspace(min, max, num_pts + 1);
    
end