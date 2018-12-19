function [] = communicate(com, angle, distance, movementChar)
%Set the communication between arduino and matlab
    RF = 1;%Reducing Factor
    
    if(movementChar=='f')
        fwrite(com,'f');
        pause(distance*0.500/30/RF);%0.400
        fwrite(com,'s');
        pause(0.5);
    
    elseif(movementChar=='b')
        fwrite(com,'b');
        pause(distance*0.590/30/RF);%0.610
        fwrite(com,'s');
        pause(0.5);
    
    elseif(movementChar=='r')
        fwrite(com,'r');
        pause(angle*0.268/90/RF);%0.320
        fwrite(com,'s');
        pause(0.5);
    
    elseif(movementChar=='l')
        fwrite(com,'l');
        pause(angle*0.268/90/RF);%0.300
        fwrite(com,'s');
        pause(1);
   
    elseif(movementChar=='u')
        fwrite(com,'u');
        pause(0.5);
    
    elseif(movementChar=='d')
        fwrite(com,'d');
        pause(0.5);
        
    %LED
    %Green
    elseif(movementChar=='x')
        fwrite(com,'x');
    %Red
    elseif(movementChar=='y')
        fwrite(com,'y');
    %Blue
    elseif(movementChar=='z')
        fwrite(com,'z');
    end
end

