function [] = trial(varDist, ch)
%BOGUS FUNCTION
%     global com
%     communicate(com, varDist, ch);
    vid = videoinput('winvideo', 1, 'MJPG_1024x768');
    src = getselectedsource(vid);

    preview(vid);
    [~ , ARENABB] = imcrop(getsnapshot(vid));
    arena = imcrop(getsnapshot(vid), ARENABB);
    imtool(arena);
    imtool(arena);
end

