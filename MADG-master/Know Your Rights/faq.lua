-----------------------------------------------------------------------------------------
--
-- faq.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local dataControl = require("datacontrol")

local dataFileName = "faqContent.txt"
local contentTitle = {"Frequently Asked Questions"}
local content = {"No data found"}
local rowHeightInsert = 250


function btnBackPressed(event)
    composer.gotoScene( "home")
end


local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row
    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

	-- create heading text
    local rowTitle = display.newText( row, contentTitle[1], display.contentCenterX, display.contentCenterY, "Lucida Sans Unicode", 20 )
    rowTitle:setFillColor( 0 )

    
    rowTitle.anchorX = 0	
    rowTitle.x = 10 
    rowTitle.y = rowHeight * 0.1 
	
	-- create content variables
	local rowContent = display.newText(row, content[1], display.contentCenterX, 0, display.contentWidth - 4, 0, "Lucida Sans Unicode", 14)
	rowContent:setFillColor(0)
	
-- row content position variables
rowContent.anchorX = 0
rowContent.anchorY = 0
rowContent.x = 10
rowContent.y=rowHeight *.15
end

local function onRowTouch( event )

  local options = {effect="fromRight", time=400, params={row=event.row.index}}
  -- dataControl.getData("faqContent.txt")
  
  recievedContent, rowHeight = dataControl.getData("faqContent.txt")
  print(recievedContent)
  print (rowHeight)
  display.newText(recievedContent, display.contentCenterX, 40, "Lucida Sans Unicode", 15)
       content[1] = recievedContent
       rowHeightInsert = rowHeight
end



function scene:create( event )
	local sceneGroup = self.view
	--local row = event.params.row

	-- create some text
--	local title = display.newText( "Frequently Asked Questions", display.contentCenterX, 20, "Lucida Sans Unicode", 15 )
	--title:setFillColor( 1 )	-- black
	
	local btnBack = widget.newButton{
    width = 40,
    height = 40,
    onEvent = btnBackPressed,
    defaultFile = 'btnImages/btnBackImage.png'
  }

  btnBack.y = 15
  btnBack.x = 30

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
for i = 1, #contentTitle do
    -- Insert a row into the tableView
    tableView:insertRow({rowHeight = (display.contentHeight - 70)/4})

end

--	sceneGroup:insert( contentTitle )
  sceneGroup:insert(btnBack)
  sceneGroup:insert(tableView)
  --tableView:scrollToIndex(row,20)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	--local row = event.params.row

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
