function [  ] = defineCom(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    global com
    com = serial('COM3','BAUDRATE', 9600);
    fopen(com);
    pause(3);

end

