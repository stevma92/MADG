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

local btnOverview
local btnLegislation
local btnProcedure
local btnSearches
local title


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


function btnBackPressed(event)

	composer.gotoScene("SS")

end


function btnOvPressed(event)

	setHighlightFalse()
	btnOV_Sel.isVisible = true
	btnOV.isVisible = false

		webView:request( "SS_Pages/overview.html", system.ResourceDirectory )
end

function btnLegPressed(event)

	setHighlightFalse()
	btnLeg_Sel.isVisible = true
	btnLeg.isVisible = false
	webView:request( "SS_Pages/legislation.html", system.ResourceDirectory )
end


function btnPRPressed(event)

	setHighlightFalse()
	btnPR_Sel.isVisible = true
	btnPR.isVisible = false
	webView:request( "SS_Pages/procedures.html", system.ResourceDirectory )
end


function btnSearchPressed(event)

	setHighlightFalse()
	btnSearch_Sel.isVisible = true
	btnSearch.isVisible = false
	webView:request( "SS_Pages/searches.html", system.ResourceDirectory )
end





function scene:create( event )
	local sceneGroup = self.view
	page = event.params.page
	-- create some text
  title = display.newText( "Stop & Search", display.contentCenterX, titleYLocation, "Lucida Sans Unicode", 25 )
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
 	btnLeg_Sel.isVisible=false

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
 	btnPR_Sel.isVisible=false


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
 	btnSearch_Sel.isVisible=false


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
	btnMainGroup.isVisible = false

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
