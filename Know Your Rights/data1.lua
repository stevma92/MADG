-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

contentTitle = {"Overview", "Legislation", "Procedure  & Rights", "Type of Searches"}
content = {"Overview Content", "Legislation Content", "Procedure  & Rights Content", "Type of Searches Cpntent"}


local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rowTitle = display.newText( row, contentTitle[row.index], 0, 0, nil, 20 )
    rowTitle:setFillColor( 0 )

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 0
    rowTitle.y = rowHeight * 0.1

    local rowContent = display.newText( row, content[row.index], 0, 0, nil, 12 )
    rowContent:setFillColor( 0 )

    -- Align the label left and vertically centered
    rowContent.anchorX = 0
    rowContent.x = 0
    rowContent.y = rowHeight * 0.3
end



function scene:create( event )
	local sceneGroup = self.view

  local row = event.params.row
  tableView = widget.newTableView(
    {
        left = 10,
        top = 40,
        height = display.contentHeight - 100,
        width = display.contentWidth - 20,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = scrollListener
    }
)

-- Insert 40 rows
for i = 1, #contentTitle do
    -- Insert a row into the tableView
    tableView:insertRow({ rowHeight=200})
end



  sceneGroup:insert(tableView)
  tableView:scrollToIndex(row,20)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
  local row = event.params.row
  tableView:scrollToIndex(row,20)

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
