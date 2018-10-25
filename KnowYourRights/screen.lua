--[[ Open Source code found at https://github.com/phpedinei/dropdown
     Contains variables used in the creation of the drop down menu ]]--


local Screen = {}

Screen.totalWidth  = display.contentWidth-(display.screenOriginX*2);
Screen.totalHeight = display.contentHeight-(display.screenOriginY*2);
Screen.centerX     = display.contentCenterX;
Screen.centerY     = display.contentCenterY;
Screen.originX     = display.screenOriginX;
Screen.originY     = display.screenOriginY;
Screen.leftSide    = display.screenOriginX;
Screen.rightSide   = display.contentWidth-display.screenOriginX;
Screen.topSide     = display.screenOriginY;
Screen.bottomSide  = display.contentHeight-display.screenOriginY;

return Screen
