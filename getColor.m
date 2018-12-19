function [blockColor] = getColor(image)
%Gives the color of the block (Red Green White Black)
    global REDVALUES
    global GREENVALUES
    global WHITEVALUES
    global BLACKVALUES
    global BLUEVALUES
    global YELLOWVALUES
    
    global RED;
    global GREEN;
    global WHITE;
    global BLACK;
    global BLUE;
    global YELLOW;
    
    blockColor = BLACK;
    
    red = mean(mean(image(:,:,1)));
    green = mean(mean(image(:,:,2)));
    blue = mean(mean(image(:,:,3)));
    
    if(red <= WHITEVALUES(1,1) & red >= WHITEVALUES(1,2) & green <= WHITEVALUES(1,3) & green >= WHITEVALUES(1,4) & blue <= WHITEVALUES(1,5) & blue >= WHITEVALUES(1,6));
        blockColor = WHITE;
    elseif(red <= REDVALUES(1,1) & red >= REDVALUES(1,2) & green <= REDVALUES(1,3) & green >= REDVALUES(1,4) & blue <= REDVALUES(1,5) & blue >= REDVALUES(1,6));
        blockColor = RED;
    elseif(red <= GREENVALUES(1,1) & red >= GREENVALUES(1,2) & green <= GREENVALUES(1,3) & green >= GREENVALUES(1,4) & blue <= GREENVALUES(1,5) & blue >= GREENVALUES(1,6));
        blockColor = GREEN;
    elseif(red <= BLACKVALUES(1,1) & red >= BLACKVALUES(1,2) & green <= BLACKVALUES(1,3) & green >= BLACKVALUES(1,4) & blue <= BLACKVALUES(1,5) & blue >= BLACKVALUES(1,6));
        blockColor = BLACK;
    elseif(red <= BLUEVALUES(1,1) & red >= BLUEVALUES(1,2) & green <= BLUEVALUES(1,3) & green >= BLUEVALUES(1,4) & blue <= BLUEVALUES(1,5) & blue >= BLUEVALUES(1,6));
        blockColor = BLUE;
    elseif(red <= YELLOWVALUES(1,1) & red >= YELLOWVALUES(1,2) & green <= YELLOWVALUES(1,3) & green >= YELLOWVALUES(1,4) & blue <= YELLOWVALUES(1,5) & blue >= YELLOWVALUES(1,6));
        blockColor = YELLOW;
    end
end