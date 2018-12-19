function [angle] = getAngle(vector1, vector2)
%Gives the angle(in DEGREES) between vectors 1 and 2
%Angle measured by rotation of vector1 to vector2
%CLOCKWISE +ve (if X-axis is +ve to the RIGHT and Y-axis is +ve DOWNWARDS)
    angle = atan2d(cross(vector1,vector2),dot(vector1,vector2));%Returns a 1x3 matrix where element 3 is required
    angle = angle(3);
end

