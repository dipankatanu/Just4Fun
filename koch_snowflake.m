
%The Koch snowflake is created by recursively dividing each side of an
% equilateral triangle into three equal parts, creating a smaller equilateral triangle 
% in the middle of each side.

function koch_snowflake(iterations)
    % Initial equilateral triangle coordinates
    theta = pi/3;  % 60 degrees in radians
    % define three vertices
    p1 = [0, 0]; 
    p2 = [1, 0]; 
    p3 = [cos(theta), sin(theta)]; 

    % Initial triangle
    points = [p1; p2; p3; p1];

    % Iteratively apply the Koch curve generation
    for i = 1:iterations
        points = koch_iteration(points);
    end

    plot(points(:,1), points(:,2), 'b-', 'LineWidth', 2)
    axis equal off
    title(['Koch Snowflake - Iteration ', num2str(iterations)])
end

function new_points = koch_iteration(points)
    % Perform one iteration of the Koch curve
    new_points = [];
    for i = 1:(size(points, 1) - 1)
        p1 = points(i, :);
        p2 = points(i+1, :);
        % Compute new points dividing the edge into 3 segments
        s = (p2 - p1) / 3;
        pA = p1 + s;  % First third
        pB = p1 + 2*s;  % Second third
        % Compute the point to form the triangle (rotation by 60 degrees)
        pC = pA + [cos(pi/3)*s(1) - sin(pi/3)*s(2), sin(pi/3)*s(1) + cos(pi/3)*s(2)];
        % Add new points to the new points array
        new_points = [new_points; p1; pA; pC; pB];
    end
    % Add the final point
    new_points = [new_points; points(end, :)];
end

% example 
%koch_snowflake(6);

