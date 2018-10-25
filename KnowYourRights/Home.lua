-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- Home.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

--[[Item placement Variables ]]--
local X = display.contentCenterX
local Y = display.contentCenterY*0.95
local W = display.contentWidth - 10
local H = display.contentHeight*0.75


function scene:create( event )
	local sceneGroup = self.view

	local backGround = display.newImage(  "btnImages/Main/Home.png", X , Y)


	local options =
	{
	    text = "KNOW YOUR RIGHTS",
	    x = X,
	    width = W*0.9,
	    font = native.systemFont,
	    fontSize = 60,
			align = "center"
	}
	local title = display.newText( options )
	title:setFillColor( 1, 1, 1 )

	-- Set vertical anchor on object to 0 (top)
	title.anchorY = 0
	-- Align object to top alignment axis
	title.y = Y*0.5

	sceneGroup:insert(backGround)
  sceneGroup:insert(title)

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
