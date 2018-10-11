-------------------------------------------------------------
-- home.lua
------------------------------------------------------------


local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
--local contentTitle = {"Stop & Search", "RBT", "Community Rights", "Traffic Stop"}

function scene:create( event )
	local sceneGroup = self.view

	-- create some text
	local title = display.newText( "Know Your Rights", display.contentCenterX, 20, "Lucida Sans Unicode", 25 )
	title:setFillColor( 1 )	-- black

 local tableView = widget.newTableView(
    {
        left = 10,
        top = 40,
        height = display.contentHeight - 70,
        width = display.contentWidth - 20,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = scrollListener
    }
)


-- Insert 40 rows
--for i = 1, #contentTitle do
    -- Insert a row into the tableView
    -- tableView:insertRow({rowHeight = (display.contentHeight - 70)/4})

--end

	sceneGroup:insert( title )
    sceneGroup:insert(tableView)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
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
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
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