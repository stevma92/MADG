-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

local X = display.contentCenterX
local Y = display.contentCenterY*0.95
local W = display.contentWidth - 10
local H = display.contentHeight*0.75




function btnECallPressed(event)

	system.openURL( "tel:000" )

end

function btnPACallPressed(event)

	system.openURL( "tel:131444" )

end


function btnLACallPressed(event)

	system.openURL( "tel:1300650579" )

end


function btnBackPressed(event)

	composer.gotoScene("Home")

end




function scene:create( event )
	local sceneGroup = self.view

	local bg = display.newRect(X,Y,W,H)

	-- create some text
	local title = display.newText( "Contact Details", display.contentCenterX, display.contentHeight*0.05, "Lucida Sans Unicode", 25 )
	title:setFillColor( 1 )	-- black

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


	local txtEmergency = display.newText( "EMERGENCY SERVICES: 000", W*0.05, H*0.2,  "Lucida Sans Unicode", 18 )
	txtEmergency:setFillColor(0)
	txtEmergency.anchorX = 0

	btnECall = widget.newButton(
    {
      id = " btnECall",
      width = btnWidth/2,
      height = btnHeight/2,
      defaultFile = "btnImages/Call.png",
      onPress = btnECallPressed
    }
  )

	btnECall.x =  display.contentWidth*0.91
	btnECall.y =  H*0.2


	local txtPoliceAssistance = display.newText( "Police Assistance: 131 444", W*0.05, H*0.3,  "Lucida Sans Unicode", 18 )
	txtPoliceAssistance:setFillColor(0)
	txtPoliceAssistance.anchorX = 0

	btnPACall = widget.newButton(
		{
			id = " btnPACall",
			width = btnWidth/2,
			height = btnHeight/2,
			defaultFile = "btnImages/Call.png",
			onPress = btnPACallPressed
		}
	)

	btnPACall.x =  display.contentWidth*0.91
	btnPACall.y =  H*0.3

	local txtLegalAid = display.newText( "Legal Aid WA: 1300 650 579 ", W*0.05, H*0.4,  "Lucida Sans Unicode", 18 )
	txtLegalAid:setFillColor(0)
	txtLegalAid.anchorX = 0

	btnLACall = widget.newButton(
		{
			id = " btnLACall",
			width = btnWidth/2,
			height = btnHeight/2,
			defaultFile = "btnImages/Call.png",
			onPress = btnLACallPressed
		}
	)

	btnLACall.x =  display.contentWidth*0.91
	btnLACall.y =  H*0.4






	sceneGroup:insert(bg)
  sceneGroup:insert(title)
  sceneGroup:insert(btnBack)
	sceneGroup:insert(txtEmergency)
	sceneGroup:insert(btnECall)
	sceneGroup:insert(txtPoliceAssistance)
	sceneGroup:insert(btnPACall)
	sceneGroup:insert(txtLegalAid)
	sceneGroup:insert(btnLACall)




end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

  --webView:request( "DropDownMenu_Pages/contact.html", system.ResourceDirectory )
	if phase == "will" then

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
