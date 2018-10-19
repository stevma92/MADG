-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local contentTitle = {"Overview", "Community Rights", "Community Obligations"}


local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rowTitle = display.newText( row, contentTitle[row.index], display.contentCenterX, display.contentCenterY, "Lucida Sans Unicode", 20 )
    rowTitle:setFillColor( 0 )

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0.5
    rowTitle.x = row.contentWidth / 2
    rowTitle.y = rowHeight * 0.5
end

local function onRowTouch( event )

  local options = {params={page=event.row.index}}
  composer.gotoScene( "CR_Data" , options )
end


function scene:create( event )
	local sceneGroup = self.view

	-- create some text
	local title = display.newText( "Community Rights", display.contentCenterX, display.contentHeight*0.05, "Lucida Sans Unicode", 22 )
	title:setFillColor( 1 )	-- black

  local tableView = widget.newTableView(
    {
        left = 10,
        top = display.contentHeight*0.1,
        height = display.contentHeight - 200,
        width = display.contentWidth - 20,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = scrollListener
    }
)


for i = 1, #contentTitle do
    -- Insert a row into the tableView
    tableView:insertRow({rowHeight = (display.contentHeight - 200)/3})

end

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
