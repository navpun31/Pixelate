function [blueprint] = getBlueprint(arena)
%Returns the 'blueprint' matrix from the image of the Blueprint
    global WHITE
    global RED
    global GREEN
    [rows, cols, ~] = size(arena);
    width = cols/24 * 5;
    height = rows/8;
    [bpImage,~] = getBlueprintNodes(arena);
    %imtool(bpImage);
    
    blueprint = [WHITE WHITE WHITE WHITE WHITE; WHITE WHITE WHITE WHITE WHITE; WHITE WHITE WHITE WHITE WHITE];
    
    blockWidth = width/5;
    blockHeight = height/3;
    numRows = 3;
    numCols = 5;
    RF = blockWidth/4; %reducing factor - by which the blockImage gets cropped(only the center of the image is tested for color)
    for i = 1:numRows
        for j = 1:numCols
            blockImage = imcrop(bpImage, [((j-1)*blockWidth+RF) ((i-1)*blockHeight+RF) (blockWidth-2*RF) (blockHeight-2*RF)]);
            %imtool(blockImage);
            blueprint(i,j) = getColor(blockImage);
            if(blueprint(i,j) ~= RED && blueprint(i,j) ~= GREEN)
                blueprint(i,j) = WHITE;
            end
        end
    end
end