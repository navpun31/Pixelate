function [k] = Check_Black(im)
global BLACKVALUES
im_temp=seperateColor(im,BLACKVALUES);
%imtool(im_temp);

[r c]=size(im_temp);
im_temp=imcrop(im_temp,[c*4/100 r*4/100 c*92/100 r*92/100]);
[r c]=size(im_temp);
k=1;sum=0;
 for i=1:r*c 
   sum=sum+im_temp(i);
 end        
 k=sum/(r*c);
end

