-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- SS.Lua
-- Stop and Search
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
--[[Headings called by the row render. They are placed here so the can easily be modified]]--
local contentTitle = {"Overview", "Legislation", "Procedure & Rights", "Type of Searches"}


local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    --[[displaying the headings for each section in the row]]--
    local rowTitle = display.newText( row, contentTitle[row.index], display.contentCenterX, display.contentCenterY, "Lucida Sans Unicode", 20 )
    rowTitle:setFillColor( 0 )

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0.5
    rowTitle.x = row.contentWidth / 2
    rowTitle.y = rowHeight * 0.5
end

--[[Each Row represent a section under the main category
    When a row is pressed the Data Scene is called and also the row
    selected is passed as a parameter]]--
local function onRowTouch( event )

  local options = {params={page=event.row.index}}
  composer.gotoScene( "SS_Data" , options )
end


function scene:create( event )
	local sceneGroup = self.view

	local title = display.newText( "Stop & Search", display.contentCenterX, display.contentHeight*0.05, "Lucida Sans Unicode", 25 )
	title:setFillColor( 1 )

  --[[Creating table view to show all the sections]]--
  local tableView = widget.newTableView(
    {
        left = 10,
        top = display.contentHeight*0.1,
        height = display.contentHeight - 120,
        width = display.contentWidth - 20,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = scrollListener
    }
  )

  for i = 1, #contentTitle do
    -- Insert a row into the tableView
    tableView:insertRow({rowHeight = (display.contentHeight - 120)/4})
  end

	sceneGroup:insert( title )
  sceneGroup:insert(tableView)

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
