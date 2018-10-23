-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- PO_Data.Lua
-- Rights When Pulled Over Data File
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

	btnProc.isVisible = true
	btnProc_Sel.isVisible = false

	btnRo.isVisible = true
	btnRo_Sel.isVisible = false
end

--[[Returns from the data view back to the Pulled Over Menu]]--
function btnBackPressed(event)
	composer.gotoScene("PO")
end

--[[ Button Overview Pressed Sets the overview tab button to its highlighted state
passes the overview HTML file to the webView to be displayed ]]--
function btnOvPressed(event)
	setHighlightFalse()
	btnOV_Sel.isVisible = true
	btnOV.isVisible = false
	webView:request( "PO_Pages/overview.html", system.ResourceDirectory )
end

--[[ Button procedure Pressed Sets the procedure tab button to its highlighted state
passes the procedure HTML file to the webView to be displayed ]]--
function btnProcPressed(event)
	setHighlightFalse()
	btnProc_Sel.isVisible = true
	btnProc.isVisible = false
	webView:request( "PO_Pages/procedure.html", system.ResourceDirectory )
end

--[[ Button rights and obligations Pressed Sets the rights and obligations tab button to its highlighted state
passes the rights ans obligations HTML file to the webView to be displayed ]]--
function btnRoPressed(event)
	setHighlightFalse()
	btnRo_Sel.isVisible = true
	btnRo.isVisible = false
	webView:request( "PO_Pages/rightsandobligations.html", system.ResourceDirectory )
end


function scene:create( event )
	local sceneGroup = self.view
	page = event.params.page

	--[[ Create and Display Heading Text]]--
  title = display.newText( "Rights When Pulled Over", display.contentCenterX, titleYLocation, "Lucida Sans Unicode", 18 )
	title:setFillColor( 1 )	-- black

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
			defaultFile = "btnImages/PO/overview.png",
			onPress = btnOvPressed
		}
	)

	btnOV_Sel = widget.newButton(
	  {
	    id = " btnOV_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/PO/overview_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnOV_Sel.isVisible=false


	--[[ Create two versions of the procedure button
			 1. for default 2. for selected ]]--
	btnProc = widget.newButton(
	  {
	    id = " btnProc",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/PO/procedure.png",
	    onPress = btnProcPressed
	  }
	)


	btnProc_Sel = widget.newButton(
	  {
	    id = " btnProc_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/PO/procedure_Sel.png"
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
	    defaultFile = "btnImages/PO/ro.png",
	    onPress = btnRoPressed
	  }
	)


	btnRo_Sel = widget.newButton(
	  {
	    id = " btnRo_Sel",
	    width = btnWidth,
	    height = btnHeight,
	    defaultFile = "btnImages/PO/ro_Sel.png"
	  }
	)
	--[[Hide the selected version of the button]]--
 	btnRo_Sel.isVisible=false

	--[[Alignment of the buttons on the screen]]--
	btnBack.x =  display.contentWidth*0.1
	btnBack.y =  titleYLocation

	btnOV.x = display.contentCenterX - btnWidth
	btnOV.y = btnYLocation

	btnOV_Sel.x = btnOV.x
	btnOV_Sel.y = btnOV.y

	btnProc.x = display.contentCenterX
	btnProc.y = btnYLocation

	btnProc_Sel.x = btnProc.x
	btnProc_Sel.y = btnProc.y

	btnRo.x = display.contentCenterX + btnWidth
	btnRo.y = btnYLocation

	btnRo_Sel.x = btnRo.x
	btnRo_Sel.y = btnRo.y

	--[[insert all items into the scenes group]]--
	sceneGroup:insert(title)
	sceneGroup:insert(webView)
	sceneGroup:insert(btnBack)
	sceneGroup:insert(btnOV)
	sceneGroup:insert(btnOV_Sel)
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
	elseif page == 2 then
		btnProcPressed()
	elseif page == 3 then
		btnRoPressed()
	else
		composer.gotoScene( "PO" )
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
