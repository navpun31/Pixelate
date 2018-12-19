vid = videoinput('winvideo', 1, 'MJPG_1024x576');
src = getselectedsource(vid);

src.Brightness = 54;
src.Contrast = 42;
src.Exposure = -5;
src.Gain = 107;
src.Saturation = 82;

preview(vid);
arena = getsnapshot(vid);
% 
% src.Brightness = 79;
% src.Contrast = 40;
% src.Exposure = -5;
% src.Saturation = 82;

