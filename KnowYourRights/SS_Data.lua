-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- CR_Data.Lua
-- Community Rights Data File
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

--[[Variables to control size and location of the webView]]--
local webviewX = display.contentCenterX
local webviewY = display.contentCenterY*0.95
local webviewW = display.contentWidth - 10
local webviewH = display.contentHeight*0.75
local webView

--[[ Sets all selection buttons on the tab bar to their unhighlighted state ]]--
local function setHighlightFalse()

	btnOV.isVisible = true
	btnOV_Sel.isVisible = false

	btnLeg.isVisible = true
	btnLeg_Sel.isVisible = false

	btnPR.isVisible = true
	btnPR_Sel.isVisible = false

	btnSearch.isVisible = true
	btnSearch_Sel.isVisible = false
end

--[[Returns from the data view back to the Stop and Search Menu]]--

function btnBackPressed(event)
	composer.gotoScene("SS")
end

--[[ Button Overview Pressed Sets the overview tab button to its highlighted state
     passes the overview HTML file to the webView to be displayed ]]--
function btnOvPressed(event)
	setHighlightFalse()
	btnOV_Sel.isVisible = true
	btnOV.isVisible = false
	webView:request( "SS_Pages/overview.html", system.ResourceDirectory )
end

--[[ Button legislation Pressed Sets the legislation tab button to its highlighted state
     passes the legislation HTML file to the webView to be displayed ]]--
function btnLegPressed(event)
	setHighlightFalse()
	btnLeg_Sel.isVisible = true
	btnLeg.isVisible = false
	webView:request( "SS_Pages/legislation.html", system.ResourceDirectory )
end

--[[ Button procedures and rights Pressed Sets the procedure and rights tab button to its highlighted state
     passes the procedure and rights HTML file to the webView to be displayed ]]--
function btnPRPressed(event)
	setHighlightFalse()
	btnPR_Sel.isVisible = true
	btnPR.isVisible = false
	webView:request( "SS_Pages/procedures.html", system.ResourceDirectory )
end

--[[ Button types of searches Pressed Sets the types of searches tab button to its highlighted state
     passes the procedure and rights HTML file to the webView to be displayed ]]--
function btnSearchPressed(event)
	setHighlightFalse()
	btnSearch_Sel.isVisible = true
	btnSearch.isVisible = false
	webView:request( "SS_Pages/searches.html", system.ResourceDirectory )
end

function scene:create( event )
	local sceneGroup = self.view
	page = event.params.page

	--[[ Create and Display Heading Text]]--
  title = display.newText( "Stop & Search", display.contentCenterX, titleYLocation, "Lucida Sans Unicode", 25 )
	title:setFillColor( 1 )

	--[[ Creates and displays webView]]--
	webView = native.newWebView( webviewX, webviewY, webviewW, webviewH )

	--[[Create the back button]]--
	btnBack = widget.newButton(
		{
			id = " btnBack",
			width = btnWidth/2,
			height = btnHeight/2,
			defaultFile = "btnImages/btnBack.png",
			onPress = btnBackPressed
		}
	)

	--[[ Create two versions of the Overview button
			 1. for default 2. for selected ]]--
	btnOV = widget.newButton(
		{
			id = " btnOV",
			width = btnWidth,
			height = btnHeight,
			defaultFile = "btnImages/SS/overview.png",
			onPress = btnOvPressed
		}
	)

	btnOV_Sel = widget.newButton(
	  {
	    id = " btnOV_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/SS/overview_Sel.png"
	  }
	)
 	btnOV_Sel.isVisible=false

	--[[ Create two versions of the legislation button
			 1. for default 2. for selected ]]--
	btnLeg = widget.newButton(
	  {
	    id = " btnLeg",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/SS/legislation.png",
	    onPress = btnLegPressed
	  }
	)


	btnLeg_Sel = widget.newButton(
	  {
	    id = " btnLeg_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/SS/legislation_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnLeg_Sel.isVisible=false

	--[[ Create two versions of the Procedures and Rights button
			 1. for default 2. for selected ]]--
	btnPR = widget.newButton(
	  {
	    id = " btnPR",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/SS/PR.png",
	    onPress = btnPRPressed
	  }
	)


	btnPR_Sel = widget.newButton(
	  {
	    id = " btnPR_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/SS/PR_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnPR_Sel.isVisible=false

	--[[ Create two versions of the stop and search button
			 1. for default 2. for selected ]]--
	btnSearch = widget.newButton(
	  {
	    id = " btnSearch",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/SS/search.png",
	    onPress = btnSearchPressed
	  }
	)


	btnSearch_Sel = widget.newButton(
	  {
	    id = " btnSearch_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/SS/search_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnSearch_Sel.isVisible=false

	--[[Alignment of the buttons on the screen]]--
	btnBack.x =  display.contentWidth*0.1
	btnBack.y =  titleYLocation


	btnOV.x = btnXLocation * 1
	btnOV.y = btnYLocation

	btnOV_Sel.x = btnOV.x
	btnOV_Sel.y = btnOV.y


	btnLeg.x = btnXLocation + btnWidth
	btnLeg.y = btnYLocation

	btnLeg_Sel.x = btnLeg.x
	btnLeg_Sel.y = btnLeg.y


	btnPR.x = btnXLocation + btnWidth * 2
	btnPR.y = btnYLocation

	btnPR_Sel.x = btnPR.x
	btnPR_Sel.y = btnPR.y


	btnSearch.x = btnXLocation + btnWidth * 3
	btnSearch.y = btnYLocation

	btnSearch_Sel.x = btnSearch.x
	btnSearch_Sel.y = btnSearch.y

--[[insert all items into the scenes group]]--
	sceneGroup:insert(title)
	sceneGroup:insert(webView)
	sceneGroup:insert(btnBack)
	sceneGroup:insert(btnOV)
	sceneGroup:insert(btnOV_Sel)
	sceneGroup:insert(btnLeg)
	sceneGroup:insert(btnLeg_Sel)
	sceneGroup:insert(btnPR)
	sceneGroup:insert(btnPR_Sel)
	sceneGroup:insert(btnSearch)
	sceneGroup:insert(btnSearch_Sel)
end

function scene:show( event )
	sceneGroup = self.view
	local phase = event.phase
	local page = event.params.page

	--[[ Hides the Main section buttons as the Sections sub sections buttons
	     will appear in their place while the data view is active ]]--
	btnMainGroup.isVisible = false
	btnDropDownGroup.isVisible = false

	--[[ Selects the page based off the row index of the Sections menu pages ]]--
	if page == 1 then
		btnOvPressed()
	elseif  page == 2 then
		btnLegPressed()
	elseif page == 3 then
		btnPRPressed()
	elseif page == 4 then
		btnSearchPressed()
	else
		composer.gotoScene( "SS" )
	end


	if phase == "will" then
		webView.isVisible = true

	elseif phase == "did" then

	end
end


function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
		webView.isVisible = false
	elseif phase == "did" then
		--[[Re enables the Main section buttons]]--
		btnMainGroup.isVisible = true
		btnDropDownGroup.isVisible = true
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
