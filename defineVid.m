function [] = defineVid()
%Defines the video input and other caliberations
    global vid
  vid = videoinput('winvideo', 1, 'YUY2_1280x960');
src = getselectedsource(vid);

src.Brightness = 115;

src.Brightness = 107;

src.Contrast = 7;

src.Contrast = 36;

src.Contrast = 57;

src.Saturation = 52;

src.Saturation = 62;

src.Saturation = 67;

vid.ReturnedColorspace = 'rgb';

end

