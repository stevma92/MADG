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


---[[
local function setHighlightFalse()

	btnOV.isVisible = true
	btnOV_Sel.isVisible = false

	btnRights.isVisible = true
	btnRights_Sel.isVisible = false

	btnObligation.isVisible = true
	btnObligation_Sel.isVisible = false

end


function btnBackPressed(event)

	composer.gotoScene("CR")

end


function btnOvPressed(event)

	setHighlightFalse()
	btnOV_Sel.isVisible = true
	btnOV.isVisible = false

		webView:request( "CR_Pages/overview.html", system.ResourceDirectory )
end

function btnRightsPressed(event)

	setHighlightFalse()
	btnRights_Sel.isVisible = true
	btnRights.isVisible = false
	webView:request( "CR_Pages/rights.html", system.ResourceDirectory )
end


function btnObligationPressed(event)

	setHighlightFalse()
	btnObligation_Sel.isVisible = true
	btnObligation.isVisible = false
	webView:request( "CR_Pages/obligations.html", system.ResourceDirectory )
end

--]]

function scene:create( event )
	local sceneGroup = self.view
	page = event.params.page
	-- create some text
  title = display.newText( "Community Rights", display.contentCenterX, titleYLocation, "Lucida Sans Unicode", 20 )
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
 	btnOV_Sel.isVisible=false


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
 	btnRights_Sel.isVisible=false

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
 	btnObligation_Sel.isVisible=false




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
	btnMainGroup.isVisible = false

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
