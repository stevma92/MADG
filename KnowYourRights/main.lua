-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- Required libraries
local widget = require "widget"
local composer = require "composer"
local dropdown = require("dropdown")


titleYLocation = display.contentHeight*0.05
btnWidth = display.contentWidth/4
btnHeight = display.contentWidth/4 - 20
btnXLocation = btnWidth/2
btnYLocation = display.contentHeight - (btnHeight / 2)
btnMainGroup = display.newGroup()


local function setHighlightFalse()
  btnSS.isVisible = true
  btnSS_Sel.isVisible = false
  btnCR.isVisible = true
  btnCR_Sel.isVisible = false
  btnRBT.isVisible = true
  btnRBT_Sel.isVisible = false
  btnPO.isVisible = true
  btnPO_Sel.isVisible = false
end




-- Go to Stop and Search
local function onSSView( event )

  setHighlightFalse()
  btnSS.isVisible = false
  btnSS_Sel.isVisible = true
  composer.gotoScene( "SS" )
end

local function onCRView( event )

  setHighlightFalse()
  btnCR.isVisible = false
  btnCR_Sel.isVisible = true
  composer.gotoScene( "CR" )
end

local function onRBTView( event )

  setHighlightFalse()
  btnRBT.isVisible = false
  btnRBT_Sel.isVisible = true
  composer.gotoScene( "RBT" )
end


local function onPOView( event )

  setHighlightFalse()
  btnPO.isVisible = false
  btnPO_Sel.isVisible = true
  composer.gotoScene( "PO" )
end


-- Stop and Search Buttons
btnSS = widget.newButton(
  {
    id = " btnSS",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnSS.png",
    onPress = onSSView
  }
)

btnSS_Sel = widget.newButton(
  {
    id = " btnSS_Sel",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnSS_Sel.png",

  }
)
btnSS_Sel.isVisible=false

-- Community Rights Buttons

btnCR = widget.newButton(
  {
    id = " btnCR",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnCR.png",
    onPress = onCRView
  }
)

btnCR_Sel = widget.newButton(
  {
    id = " btnCR",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnCR_Sel.png",

  }
)
btnCR_Sel.isVisible = false


-- Raandom Breath Test buttons
btnRBT= widget.newButton(
  {
    id = " btnRBT",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnRBT.png",
    onPress = onRBTView
  }
)

btnRBT_Sel = widget.newButton(
  {
    id = " btnRBT",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnRBT_Sel.png",

  }
)
btnRBT_Sel.isVisible = false

-- Rights When Pulled Over Buttons

btnPO = widget.newButton(
  {
    id = " btnPO",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnPO.png",
    onPress = onPOView
  }
)

btnPO_Sel = widget.newButton(
  {
    id = " btnPO",
    width = btnWidth,
    height = btnHeight,
    defaultFile = "btnImages/Main/btnPO_Sel.png",

  }
)
btnPO_Sel.isVisible = false

-- Button Locations
btnSS.x = btnXLocation * 1
btnSS.y = btnYLocation

btnSS_Sel.x = btnSS.x
btnSS_Sel.y = btnSS.y


btnCR.x = btnXLocation + btnWidth
btnCR.y = btnYLocation

btnCR_Sel.x = btnCR.x
btnCR_Sel.y = btnCR.y


btnRBT.x = btnXLocation + btnWidth * 2
btnRBT.y = btnYLocation

btnRBT_Sel.x = btnRBT.x
btnRBT_Sel.y = btnRBT.y


btnPO.x = btnXLocation + btnWidth * 3
btnPO.y = btnYLocation

btnPO_Sel.x = btnPO.x
btnPO_Sel.y = btnPO.y


btnMainGroup:insert(btnSS)
btnMainGroup:insert(btnSS_Sel)
btnMainGroup:insert(btnCR)
btnMainGroup:insert(btnCR_Sel)
btnMainGroup:insert(btnRBT)
btnMainGroup:insert(btnRBT_Sel)
btnMainGroup:insert(btnPO)
btnMainGroup:insert(btnPO_Sel)

local myDropdown
local dropdownOptions = {

  {
    rightIcon = display.newImageRect('btnImages/Main/btnContact.png', 32, 32),
    title     = 'Contact Details',
    action    = function()
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end
  },
  {

    rightIcon = display.newImageRect('btnImages/Main/btnFAQ.png', 32, 32),
    title     = 'FAQ',
    action    = function()
      onFAQ()
    end
  },
}

local button = widget.newButton{
  width       = 30,
  height      = 25,
  defaultFile = 'btnImages/Main/btnDropDown.png',
  overFile    = 'btnImages/Main/btnDropDown_Sel.png',
  onEvent     = function( event )
    local target = event.target
    local phase  = event.phase
    if phase == 'began' then
      target.alpha = 1
    else
      target.alpha = 1
      if phase ==  'ended' then
        myDropdown:toggle()
      end
    end
  end
}
button.alpha = 1

myDropdown     = dropdown.new{
  x            = display.contentWidth - display.contentWidth * 0.1,
  y            = titleYLocation,
  toggleButton = button,
  width        = 280,
  marginTop    = 12,
  padding      = 20,
  options      = dropdownOptions
}

btnMainGroup:insert(myDropdown)
