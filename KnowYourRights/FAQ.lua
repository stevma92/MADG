-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- FAQ.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )


--[[Webview Positioning Variables]]--
local webviewX = display.contentCenterX
local webviewY = display.contentCenterY*0.95
local webviewW = display.contentWidth - 10
local webviewH = display.contentHeight*0.75
local webView

--[[Returns to home page when the back button is pressed]]--
function btnBackPressed(event)
	composer.gotoScene("Home")
end


function scene:create( event )
	local sceneGroup = self.view

	local title = display.newText( "FAQ", display.contentCenterX, display.contentHeight*0.05, "Lucida Sans Unicode", 25 )
	title:setFillColor( 1 )

  webView = native.newWebView( webviewX, webviewY, webviewW, webviewH )

  btnBack = widget.newButton(
    {
      id = " btnBack",
      width = btnWidth/2,
      height = btnHeight/2,
      defaultFile = "btnImages/btnBack.png",
      onPress = btnBackPressed
    }
  )

	--[[ Positioning of Back button ]]--
  btnBack.x =  display.contentWidth*0.1
	btnBack.y =  titleYLocation

	--[[Insert Scene Items into groups]]--
  sceneGroup:insert(title)
  sceneGroup:insert(webView)
  sceneGroup:insert(btnBack)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
 	--[[Load FAQ html page into webView ]]--
  webView:request( "DropDownMenu_Pages/faq.html", system.ResourceDirectory )

	if phase == "will" then
		--[[Ensure webview is visible when scence is called]]--
		webView.isVisible = true
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then

    btnDropDownGroup.isVisible = true
		--[[Hide Webview as it does not hide automatically like the title and back button]]--
		webView.isVisible = false
  	elseif phase == "did" then

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
