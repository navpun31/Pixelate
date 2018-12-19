function [redSites, greenSites] = getBlockSites()
%Gives the sites where the red/green blocks are to be kept
    global SITENODES
    global BPMATRIX
    global RED
    global GREEN
    
    redSites = [];
    greenSites = [];
    for i = 1:15
        color = BPMATRIX(getBPNodeNum(SITENODES(i)));
        if(color == RED)
            redSites = cat(2,redSites, SITENODES(i));
        elseif(color == GREEN)
            greenSites = cat(2,greenSites, SITENODES(i));
        end
    end


end

