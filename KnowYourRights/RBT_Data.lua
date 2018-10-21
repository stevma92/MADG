-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

local webviewX = display.contentCenterX
local webviewY = display.contentCenterY*0.95
local webviewW = display.contentWidth - 10
local webviewH = display.contentHeight*0.75
local webView




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


function btnBackPressed(event)
	composer.gotoScene("RBT")
end


function btnOvPressed(event)

	setHighlightFalse()
	btnOV_Sel.isVisible = true
	btnOV.isVisible = false
	webView:request( "RBT_Pages/overview.html", system.ResourceDirectory )
end

function btnDDPressed(event)
	setHighlightFalse()
	btnDD_Sel.isVisible = true
	btnDD.isVisible = false
	webView:request( "RBT_Pages/drinkdriving.html", system.ResourceDirectory )
end


function btnProcPressed(event)
	setHighlightFalse()
	btnProc_Sel.isVisible = true
	btnProc.isVisible = false
	webView:request( "RBT_Pages/procedure.html", system.ResourceDirectory )
end


function btnRoPressed(event)
	setHighlightFalse()
	btnRo_Sel.isVisible = true
	btnRo.isVisible = false
	webView:request( "RBT_Pages/rightsandobligations.html", system.ResourceDirectory )
end





function scene:create( event )
	local sceneGroup = self.view
	page = event.params.page
	-- create some text
  title = display.newText( "Random Breath Test", display.contentCenterX, titleYLocation, "Lucida Sans Unicode", 20 )
	title:setFillColor( 1 )	-- black

	webView = native.newWebView( webviewX, webviewY, webviewW, webviewH )
	webView:toBack()
	btnBack = widget.newButton(
		{
			id = " btnBack",
			width = btnWidth/2,
			height = btnHeight/2,
			defaultFile = "btnImages/btnBack.png",
			onPress = btnBackPressed
		}
	)


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
 	btnDD_Sel.isVisible=false

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
 	btnProc_Sel.isVisible=false


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
 	btnRo_Sel.isVisible=false


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
	btnMainGroup.isVisible = false
	btnDropDownGroup.isVisible = false

	if page == 1 then
		btnOvPressed()
	elseif  page == 2 then
		btnDDPressed()
	elseif page == 3 then
		btnProcPressed()
	elseif page == 4 then
		btnRoPressed()
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
		btnMainGroup.isVisible = true
		btnDropDownGroup.isVisible = true

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
