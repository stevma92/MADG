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


function btnBackPressed(event)

	composer.gotoScene("Home")

end




function scene:create( event )
	local sceneGroup = self.view

	-- create some text
	local title = display.newText( "FAQ", display.contentCenterX, display.contentHeight*0.05, "Lucida Sans Unicode", 25 )
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

  btnBack.x =  display.contentWidth*0.1
	btnBack.y =  titleYLocation


  sceneGroup:insert(title)
  sceneGroup:insert(webView)
  sceneGroup:insert(btnBack)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

  webView:request( "DropDownMenu_Pages/faq.html", system.ResourceDirectory )
	if phase == "will" then
		webView.isVisible = true
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
    btnDropDownGroup.isVisible = true
		webView.isVisible = false
  	elseif phase == "did" then

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
