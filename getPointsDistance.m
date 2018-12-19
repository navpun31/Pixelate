function [distance] = getPointsDistance(point1, point2)
%Gives the distance between points 1 and 2 in pixel
    distance = norm(getVector(point1,point2));
end

