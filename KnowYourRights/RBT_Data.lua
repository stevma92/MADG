-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- RBT_Data.Lua
-- Random Breath Test Data File
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

	btnDD.isVisible = true
	btnDD_Sel.isVisible = false

	btnProc.isVisible = true
	btnProc_Sel.isVisible = false

	btnRo.isVisible = true
	btnRo_Sel.isVisible = false
end

--[[Returns from the data view back to the Random Breath Test Menu]]--
function btnBackPressed(event)
	composer.gotoScene("RBT")
end

--[[ Button Overview Pressed Sets the overview tab button to its highlighted state
     passes the overview HTML file to the webView to be displayed ]]--
function btnOvPressed(event)
	setHighlightFalse()
	btnOV_Sel.isVisible = true
	btnOV.isVisible = false
	webView:request( "RBT_Pages/overview.html", system.ResourceDirectory )
end

--[[ Button Drink Driving Pressed Sets the drink driving tab button to its highlighted state
     passes the Drink Driving HTML file to the webView to be displayed ]]--
function btnDDPressed(event)
	setHighlightFalse()
	btnDD_Sel.isVisible = true
	btnDD.isVisible = false
	webView:request( "RBT_Pages/drinkdriving.html", system.ResourceDirectory )
end

--[[ Button procedure Pressed Sets the procedure tab button to its highlighted state
     passes the procedure HTML file to the webView to be displayed ]]--

function btnProcPressed(event)
	setHighlightFalse()
	btnProc_Sel.isVisible = true
	btnProc.isVisible = false
	webView:request( "RBT_Pages/procedure.html", system.ResourceDirectory )
end

--[[ Button Rights and Obligations Pressed Sets the Rights and obligations tab button to its highlighted state
     passes the Rights and obligations HTML file to the webView to be displayed ]]--

function btnRoPressed(event)
	setHighlightFalse()
	btnRo_Sel.isVisible = true
	btnRo.isVisible = false
	webView:request( "RBT_Pages/rightsandobligations.html", system.ResourceDirectory )
end


function scene:create( event )
	local sceneGroup = self.view
	page = event.params.page

	--[[ Create and Display Heading Text]]--
  title = display.newText( "Random Breath Test", display.contentCenterX, titleYLocation, "Lucida Sans Unicode", 20 )
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
			defaultFile = "btnImages/RBT/overview.png",
			onPress = btnOvPressed
		}
	)

	btnOV_Sel = widget.newButton(
	  {
	    id = " btnOV_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/RBT/overview_Sel.png"
	  }
	)
 	btnOV_Sel.isVisible=false

	--[[ Create two versions of the Drink Driving button
			 1. for default 2. for selected ]]--
	btnDD = widget.newButton(
	  {
	    id = " btnDD",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/RBT/dd.png",
	    onPress = btnDDPressed
	  }
	)


	btnDD_Sel = widget.newButton(
	  {
	    id = " btnDD_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/RBT/dd_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnDD_Sel.isVisible=false

	--[[ Create two versions of the procedure button
			 1. for default 2. for selected ]]--
	btnProc = widget.newButton(
	  {
	    id = " btnProc",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/RBT/procedure.png",
	    onPress = btnProcPressed
	  }
	)


	btnProc_Sel = widget.newButton(
	  {
	    id = " btnProc_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/RBT/procedure_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnProc_Sel.isVisible=false

	--[[ Create two versions of the Rights and Obligations button
			 1. for default 2. for selected ]]--
	btnRo = widget.newButton(
	  {
	    id = " btnRo",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/RBT/ro.png",
	    onPress = btnRoPressed
	  }
	)

	btnRo_Sel = widget.newButton(
	  {
	    id = " btnRo_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/RBT/ro_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnRo_Sel.isVisible=false

	--[[Alignment of the buttons on the screen]]--
	btnBack.x =  display.contentWidth*0.1
	btnBack.y =  titleYLocation

	btnOV.x = btnXLocation * 1
	btnOV.y = btnYLocation

	btnOV_Sel.x = btnOV.x
	btnOV_Sel.y = btnOV.y

	btnDD.x = btnXLocation + btnWidth
	btnDD.y = btnYLocation

	btnDD_Sel.x = btnDD.x
	btnDD_Sel.y = btnDD.y

	btnProc.x = btnXLocation + btnWidth * 2
	btnProc.y = btnYLocation

	btnProc_Sel.x = btnProc.x
	btnProc_Sel.y = btnProc.y

	btnRo.x = btnXLocation + btnWidth * 3
	btnRo.y = btnYLocation

	btnRo_Sel.x = btnRo.x
	btnRo_Sel.y = btnRo.y

	--[[insert all items into the scenes group]]--
	sceneGroup:insert(title)
	sceneGroup:insert(webView)
	sceneGroup:insert(btnBack)
	sceneGroup:insert(btnOV)
	sceneGroup:insert(btnOV_Sel)
	sceneGroup:insert(btnDD)
	sceneGroup:insert(btnDD_Sel)
	sceneGroup:insert(btnProc)
	sceneGroup:insert(btnProc_Sel)
	sceneGroup:insert(btnRo)
	sceneGroup:insert(btnRo_Sel)

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
		btnDDPressed()
	elseif page == 3 then
		btnProcPressed()
	elseif page == 4 then
		btnRoPressed()
	else
		composer.gotoScene( "RBT" )
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
