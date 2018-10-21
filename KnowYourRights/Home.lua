-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

local X = display.contentCenterX
local Y = display.contentCenterY*0.95
local W = display.contentWidth - 10
local H = display.contentHeight*0.75


function scene:create( event )
	local sceneGroup = self.view

	local bg = display.newImage(  "btnImages/Main/Home.png", X , Y)

	-- create some text
	--local title = display.newText( "KNOW YOUR RIGHTS", display.contentCenterX, display.contentHeight*.2, "Lucida Sans Unicode", 40 )
	--title:setFillColor( 1 )	-- black

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






	sceneGroup:insert(bg)
  sceneGroup:insert(title)





end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

  --webView:request( "DropDownMenu_Pages/contact.html", system.ResourceDirectory )
	if phase == "will" then

	elseif phase == "did" then
		-- Called when the scene is now on screen
		--
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
    btnDropDownGroup.isVisible = true

  	elseif phase == "did" then

	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	--
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
