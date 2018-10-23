-----------------------------------------------------------------------------------------
-- KNOW YOUR RIGHTS
-- Intro to Mobile Application Development
-- Andile Moyo | 10393863
-- Daniel Woodthorpe | 10418835
-- Fiona Slee | 10283333
-- Matt Stevens | 10457079
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- Required libraries
local widget = require "widget"
local composer = require "composer"
local dropdown = require("dropdown")


--[[ Global Variables Used for alliging elements across multiple views  ]]--
titleYLocation = display.contentHeight*0.05
btnWidth = display.contentWidth/4
btnHeight = display.contentWidth/4 - 20
btnXLocation = btnWidth/2
btnYLocation = display.contentHeight - (btnHeight / 2)
btnMainGroup = display.newGroup()
btnDropDownGroup = display.newGroup()


--[[ Local Variables to Main  ]]--
local myDropdown


--[[ Sets all Title buttons to original state as there are two buttons with differnt
     Colours overlapped ]]--
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

--[[ Calls The FAQ view and hides the drop down menu. ]]--
local function onFAQView( event )

  setHighlightFalse()

  composer.gotoScene( "FAQ" )
  btnDropDownGroup.isVisible = false
end

local function onContactView( event )

  setHighlightFalse()
  composer.gotoScene( "Contact" )
  btnDropDownGroup.isVisible = false

end


--[[ Calls The Stop & Search  view and sets the stop and search button to highlighted ]]--
local function onSSView( event )

  setHighlightFalse()
  btnSS.isVisible = false
  btnSS_Sel.isVisible = true
  composer.gotoScene( "SS" )
end

--[[ Calls The Community Rights view and sets the Community Rights button to highlighted ]]--
local function onCRView( event )

  setHighlightFalse()
  btnCR.isVisible = false
  btnCR_Sel.isVisible = true
  composer.gotoScene( "CR" )
end

--[[ Calls The Random Breath Test  view and sets the Random Breath Test button to highlighted ]]--
local function onRBTView( event )

  setHighlightFalse()
  btnRBT.isVisible = false
  btnRBT_Sel.isVisible = true
  composer.gotoScene( "RBT" )
end

--[[ Calls The Pulled Over  view and sets the Pulled Over button to highlighted ]]--
local function onPOView( event )

  setHighlightFalse()
  btnPO.isVisible = false
  btnPO_Sel.isVisible = true
  composer.gotoScene( "PO" )
end


--[[ Creates 2 Stop and Search buttons with differnet colouring, the _Sel is visible when
     the user is in the Stop and Search Section ]]--
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


--[[ Creates 2 Community Rights buttons with differnet colouring, the _Sel is visible when
     the user is in the Community Rights Section ]]--
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



--[[ Creates 2 Random Breath Test buttons with differnet colouring, the _Sel is visible when
     the user is in the Random Breath Test Section ]]--
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

--[[ Creates 2 Rights When Pulled Over buttons with differnet colouring, the _Sel is visible when
     the user is in the Rights When Pulled Over  Section ]]--

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


--[[ Button Location Settings: Moves each button over by the width of the button ]]--
btnSS.x = btnXLocation
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


--[[ Inserting all buttons into a group to allow for easy visibility changes ]]--
btnMainGroup:insert(btnSS)
btnMainGroup:insert(btnSS_Sel)
btnMainGroup:insert(btnCR)
btnMainGroup:insert(btnCR_Sel)
btnMainGroup:insert(btnRBT)
btnMainGroup:insert(btnRBT_Sel)
btnMainGroup:insert(btnPO)
btnMainGroup:insert(btnPO_Sel)



--[[ Creation of the Drop down Menu for showing FAQ and Contact Details  ]]--
--[[ Open Source code found at https://github.com/phpedinei/dropdown ]]--
local dropdownOptions = {

  {
    rightIcon = display.newImageRect('btnImages/Main/btnContact.png', 32, 32),
    title     = 'Contact Details',
    action    = function()
      onContactView()
    end
  },
  {

    rightIcon = display.newImageRect('btnImages/Main/btnFAQ.png', 32, 32),
    title     = 'FAQ',
    action    = function()
      onFAQView()
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

--[[ This group is used to be able to hide the drop down menu on certain pages]]--
btnDropDownGroup:insert(myDropdown)

--[[Go to Home Page]]--
composer.gotoScene( "Home" )
