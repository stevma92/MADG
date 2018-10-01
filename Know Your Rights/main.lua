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


-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "view1" )
end

local function onSecondView( event )
	composer.gotoScene( "view2" )
end
local function onThirdView( event )
	composer.gotoScene( "view3" )
end


function onFourthView( event )
	composer.gotoScene( "view4" )
end-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
	{ label="Stop and Search",
	defaultFile="btnBackImage.png",
	overFile="btnBackImage.png",
	width = display.contentWidth/5, height = display.contentWidth/5,
	onPress=onFirstView,
	selected=true },

	{ label="RBT",
	labelAlign="center",
	defaultFile="button2.png",
	overFile="button2-down.png",
	width = display.contentWidth/4, height = display.contentWidth/4,
	onPress=onSecondView },

	{ label="Community Rights",
	defaultFile="button2.png",
	overFile="button2-down.png",
	width = display.contentWidth/4, height = display.contentWidth/4,
	onPress=onThirdView },

	{ label="Traffic Stop",
	defaultFile="button2.png",
	overFile="button2-down.png",
	width = display.contentWidth/4, height = display.contentWidth/4,
	onPress=onFourthView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	width = display.contentWidth,
	top = display.contentHeight - 55,	-- 50 is default height for tabBar widget
	height = display.contentWidth/4 + 10,
	buttons = tabButtons
}




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
  width       = 32,
  height      = 32,
  defaultFile = 'button2.png',
  overFile    = 'button2.png',
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
  x            = screen.rightSide - 20,
  y            = screen.topSide + 50,
  toggleButton = button,
  width        = 280,
  marginTop    = 12,
  padding      = 20,
  options      = dropdownOptions
}


onFirstView()	-- invoke first tab button's onPress event manually
