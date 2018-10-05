-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"
local dropdown = require('dropdown')
local screen = require('screen')

local button1

local function onHomeView(event)
	composer.gotoScene("home")
	
end



-- event listeners for tab buttons:
local function onFirstView( event )
	-- Swap arround to make this 1 and off press  0.8 or <0.8
	button1.alpha = 0.8;
	composer.gotoScene( "view1" )


end

local function onSecondView( event )
	composer.gotoScene( "view2" )
	button1.alpha = 1;

end
local function onThirdView( event )
	composer.gotoScene( "view3" )
end


function onFourthView( event )
	composer.gotoScene( "view4" )
end



-- display.newRect( display.contentCenterX, display.contentHeight + 19  ,display.contentWidth,80)

		button1 = widget.newButton(
    {
				id = " button1",
				width = display.contentWidth/4,
        height = display.contentWidth/4 - 20 ,
        defaultFile = "btnImages/btnStop&SearchSel.png",
        onPress = onFirstView
    }
)

button1.y = display.contentHeight + 11
button1.x = 2.5 + (display.contentWidth - 20 )/8


local button2 = widget.newButton(
    {
        width = display.contentWidth/4,
        height = display.contentWidth/4 - 20,
        defaultFile = "btnImages/btnBlank.png",
        --onPress = onSecondView
    }
)

button2.y = display.contentHeight + 11
button2.x = 2.5 +display.contentWidth/4 + (display.contentWidth - 20 )/8

local button3 = widget.newButton(
    {
        width = display.contentWidth/4,
        height = display.contentWidth/4 - 20,
        defaultFile = "btnImages/btnBlank.png",
        onEvent = handleButtonEvent
    }
)

button3.y = display.contentHeight + 11
button3.x = 2.5 + (display.contentWidth/4) * 2 + (display.contentWidth - 20 )/8


local button4 = widget.newButton(
    {
        width = display.contentWidth/4,
        height = display.contentWidth/4 - 20,
        defaultFile = "btnImages/btnBlank.png",
        onEvent = handleButtonEvent
    }
)

button4.y = display.contentHeight + 11
button4.x = 2.5 +(display.contentWidth/4) * 3 + (display.contentWidth - 20 )/8


--[[ Test Variables
local xvalu = display.contentWidth/4
local yvalu = display.contentWidth/4 - 20
print("x = " .. xvalu)
print("y = " .. yvalu)
print("x/y = " .. xvalu/yvalu )
--]]


local myDropdown

local dropdownOptions = {

  {
    rightIcon = display.newImageRect('button2.png', 32, 32),
    title     = 'Contact Details',
    action    = function()
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end
  },
  {

    rightIcon = display.newImageRect('button2.png', 32, 32),
    title     = 'FAQ',
    action    = function()
      native.showAlert('Dropdown', 'Dropdown', {'Ok'})
    end
  },
}

local button = widget.newButton{
  width       = 30,
  height      = 25,
  defaultFile = 'btnImages/btnDropDown.png',
  overFile    = 'btnImages/btnDropDown.png',
  onEvent     = function( event )
    local target = event.target
    local phase  = event.phase
    if phase == 'began' then
      target.alpha = .5
    else
      target.alpha = 1
      if phase ==  'ended' then
        myDropdown:toggle()
      end
    end
  end
}
button.alpha = .5

myDropdown     = dropdown.new{
  x            = screen.rightSide - 25,
  y            = screen.topSide + 65,
  toggleButton = button,
  width        = 280,
  marginTop    = 12,
  padding      = 20,
  options      = dropdownOptions
}

onHomeView()
