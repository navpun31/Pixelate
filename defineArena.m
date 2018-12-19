function [] = defineArena()
%
    global vid
    global arena
    %Bounding Boxes
    global ARENABB
    
    %SETTING SERIAL COMMUNICATION
%     defineCom();
    
    %VIDEO DETECTION
    defineVid();

    preview(vid);
    [arena , ARENABB] = imcrop(getsnapshot(vid));
    arena = imrotate(arena, 90);
%     
%     url = 'http://100.106.253.128:8080/shot.jpg';
%     arena = imread(url);
%     [arena , ARENABB] = imcrop(arena);
    
    
    %RGB values
    global REDVALUES
    global GREENVALUES
    global WHITEVALUES
    global BLACKVALUES
    global BLUEVALUES
    global YELLOWVALUES
    REDVALUES = getMaxMinRGB(arena);
    GREENVALUES = getMaxMinRGB(arena);
    WHITEVALUES = getMaxMinRGB(arena);
    BLACKVALUES = getMaxMinRGB(arena);
    BLUEVALUES = getMaxMinRGB(arena);
    YELLOWVALUES = getMaxMinRGB(arena);
    
    imtool(seperateColor(arena, REDVALUES));
    imtool(seperateColor(arena, GREENVALUES));
    imtool(seperateColor(arena, WHITEVALUES));
    imtool(seperateColor(arena, BLACKVALUES));
    imtool(seperateColor(arena, BLUEVALUES));
    imtool(seperateColor(arena, YELLOWVALUES));
    

end

