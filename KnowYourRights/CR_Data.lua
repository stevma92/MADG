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

	btnRights.isVisible = true
	btnRights_Sel.isVisible = false

	btnObligation.isVisible = true
	btnObligation_Sel.isVisible = false
end

--[[Returns from the data view back to the Community Rights Menu]]--
function btnBackPressed(event)
	composer.gotoScene("CR")
end

--[[ Button Overview Pressed Sets the overview tab button to its highlighted state
     passes the overview HTML file to the webView to be displayed ]]--
function btnOvPressed(event)
	setHighlightFalse()
	btnOV_Sel.isVisible = true
	btnOV.isVisible = false
	webView:request( "CR_Pages/overview.html", system.ResourceDirectory )
end

--[[ Button Rights Pressed Sets the overview tab button to its highlighted state
     passes the rights HTML file to the webView to be displayed ]]--
function btnRightsPressed(event)
	setHighlightFalse()
	btnRights_Sel.isVisible = true
	btnRights.isVisible = false
	webView:request( "CR_Pages/rights.html", system.ResourceDirectory )
end

--[[ Button Obligations Pressed Sets the overview tab button to its highlighted state
     passes the Obligations HTML file to the webView to be displayed ]]--
function btnObligationPressed(event)
	setHighlightFalse()
	btnObligation_Sel.isVisible = true
	btnObligation.isVisible = false
	webView:request( "CR_Pages/obligations.html", system.ResourceDirectory )
end

function scene:create( event )
	local sceneGroup = self.view
	page = event.params.page

	--[[ Create and Display Heading Text]]--
  title = display.newText( "Community Rights", display.contentCenterX, titleYLocation, "Lucida Sans Unicode", 20 )
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
			defaultFile = "btnImages/CR/overview.png",
			onPress = btnOvPressed
		}
	)

	btnOV_Sel = widget.newButton(
	  {
	    id = " btnOV_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/CR/overview_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnOV_Sel.isVisible=false

	--[[ Create two versions of the Rights button
			 1. for default 2. for selected ]]--
	btnRights = widget.newButton(
	  {
	    id = " btnRights",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/CR/rights.png",
	    onPress = btnRightsPressed
	  }
	)

	btnRights_Sel = widget.newButton(
	  {
	    id = " btnRights_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/CR/rights_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnRights_Sel.isVisible=false

	--[[ Create two versions of the Obligations button
			 1. for default 2. for selected ]]--
	btnObligation = widget.newButton(
	  {
	    id = " btnObligation",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/CR/obligations.png",
	    onPress = btnObligationPressed
	  }
	)

	btnObligation_Sel = widget.newButton(
	  {
	    id = " btnObligation_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/CR/obligations_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
	btnObligation_Sel.isVisible=false

	--[[Alignment of the buttons on the screen]]--
	btnBack.x =  display.contentWidth*0.1
	btnBack.y =  titleYLocation

	btnOV.x = display.contentCenterX - btnWidth
	btnOV.y = btnYLocation

	btnOV_Sel.x = btnOV.x
	btnOV_Sel.y = btnOV.y

	btnRights.x = display.contentCenterX
	btnRights.y = btnYLocation

	btnRights_Sel.x = btnRights.x
	btnRights_Sel.y = btnRights.y

	btnObligation.x = display.contentCenterX + btnWidth
	btnObligation.y = btnYLocation

	btnObligation_Sel.x = btnObligation.x
	btnObligation_Sel.y = btnObligation.y

	--[[insert all items into the scenes group]]--
	sceneGroup:insert(title)
	sceneGroup:insert(webView)
	sceneGroup:insert(btnBack)
	sceneGroup:insert(btnOV)
	sceneGroup:insert(btnOV_Sel)
	sceneGroup:insert(btnRights)
	sceneGroup:insert(btnRights_Sel)
	sceneGroup:insert(btnObligation)
	sceneGroup:insert(btnObligation_Sel)
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
		btnRightsPressed()
	elseif page == 3 then
		btnObligationPressed()
	else
		composer.gotoScene( "CR" )
	end

	if phase == "will" then
		webView.isVisible = true
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
