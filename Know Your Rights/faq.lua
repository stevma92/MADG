-----------------------------------------------------------------------------------------
--
-- faq.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local dataControl = require("datacontrol")

local dataFileNames =  {"faqContent.txt"}
local contentTitle = {"FAQ"}
local content = {"No Data Found"}
local rowHeightInsert = {250, 250, 250, 250} -- Default Values (Updated to suit amount of text)


function btnBackPressed(event)
    composer.gotoScene( "home")
end


local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row
		-- Create Row Height and Width Variables
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

		-- Create Heading Text for each row in the table
    local rowTitle = display.newText(row, contentTitle[row.index], 0, 0, "Lucida Sans Unicode", 20 )
    rowTitle:setFillColor( 0 ) -- Black

    -- Row title position Variables
    rowTitle.anchorX = 0
    rowTitle.x = 10
    rowTitle.y = 30

		-- Create Content Variables
    local rowContent = display.newText( row, content[row.index], display.contentCenterX, 0, display.contentWidth - 40, 0, "Lucida Sans Unicode", 14 )
    rowContent:setFillColor( 0 )

    -- Row Content Position Variables
    rowContent.anchorX = 0
    rowContent.anchorY = 0
    rowContent.x = 10
    rowContent.y = 60
end



function scene:create( event )
	local sceneGroup = self.view
  
  -- Back Button to return to Stop & Search Menu
  local btnBack = widget.newButton{
    width = 40,
    height = 40,
    onEvent = btnBackPressed,
    defaultFile = 'btnImages/btnBackImage.png'

  }

  btnBack.y = 15
  btnBack.x = 30



	-- Get the content for each row
  -- Get the required row height for each data file
  for i = 1, #contentTitle do
				recievedContent, rowHeight = dataControl.getData(dataFileNames[i])
        content[i] = recievedContent
        rowHeightInsert[i] = 3200
	end

  -- Create a table view for displaying the data
  tableView = widget.newTableView(
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

  -- add content to each row
  -- add rows into the table
  for i = 1, #contentTitle do
      -- Insert a row into the tableView
      tableView:insertRow({ rowHeight=rowHeightInsert[i]})
  end

  sceneGroup:insert(btnBack)
  sceneGroup:insert(tableView)
end


--[[ FUNCTION SHOW --]]

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
