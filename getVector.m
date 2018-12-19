function [vector] = getVector(point1, point2)
%Gives the vector form i.e. [x y z] from point 1(x1,y1) to 2(x2,y2)
    x1 = point1(1);
    y1 = point1(2);
    x2 = point2(1);
    y2 = point2(2);
    
    vector = [x2-x1 y2-y1 0];

end

