function [canBe] = canBeUpdated(node, siteMatrix, currNode)
%Tells if the given blocked site can/can't be updated
    global SITENODES
    global ALLOWED
    global BLOCKED
    global FILLED
    global FILLED_INCORRECTLY
    global FREE
    
    canBe = 1;
    siteMatrix(node) = ALLOWED;
    
    for i = 1:15
        if(SITENODES(i) ~= node && (siteMatrix(SITENODES(i)) == ALLOWED || siteMatrix(SITENODES(i)) == FREE || siteMatrix(SITENODES(i)) == FILLED_INCORRECTLY || siteMatrix(SITENODES(i)) == BLOCKED) && isAllowedSite(SITENODES(i),siteMatrix,currNode) == 0)
            canBe = 0;
        end
    end

end

