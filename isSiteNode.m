function [bool] = isSiteNode(node)
%Checks if the given node is a Site node or not
    global SITENODES
    bool = 0;
    
    for i = 1:15
        if(SITENODES(i) == node)
            bool = 1;
        end
    end
end

