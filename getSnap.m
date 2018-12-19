function [arena] = getSnap()
%Gives the snapshot
    global vid
    global ARENABB
    
    arena = imcrop(getsnapshot(vid), ARENABB);
    arena = imrotate(arena, 90);

% url = 'http://100.106.253.128:8080/shot.jpg';
%     arena = imread(url);
%     arena = imcrop(arena, ARENABB);
    
end

