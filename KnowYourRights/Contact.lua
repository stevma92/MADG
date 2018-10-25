-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- Contact.Lua
-- Contact Details
-----------------------------------------------------------------------------------------


local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

--[[Positioning Variables]]--
local X = display.contentCenterX
local Y = display.contentCenterY*0.95
local W = display.contentWidth - 10
local H = display.contentHeight*0.75

--[[On Emergency Call Button pressed
		open phone and call 000]]--
function btnECallPressed(event)
	system.openURL( "tel:000" )
end

--[[On Police Assistance Call Button pressed
		open phone and call 131444]]--
function btnPACallPressed(event)
	system.openURL( "tel:131444" )
end

--[[On Legal Aid Call Button pressed
		open phone and call 1300 650 579]]--
function btnLACallPressed(event)
	system.openURL( "tel:1300650579" )
end

--[[Back Button Go back to Home Screen]]--
function btnBackPressed(event)
	composer.gotoScene("Home")
end


function scene:create( event )
	local sceneGroup = self.view


	--[[Set White Background]]--
	local bg = display.newRect(X,Y,W,H)

	--[[Create Title for Page]]--
	local title = display.newText( "Contact Details", display.contentCenterX, display.contentHeight*0.05, "Lucida Sans Unicode", 25 )
	title:setFillColor( 1 )	-- black

	--[[Create back button]]--
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

	--[[button: Call Emergency Servicces]]--
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

	--[[button: Call Police Assistance]]--
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

	--[[button: Call Legal Aid]]--
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

	--[[Insert all items in to the scene group]]--
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


function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if event.phase == "will" then
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
