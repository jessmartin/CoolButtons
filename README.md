CoolButtons
================================

CoolButtons is a subclass of UIButton that draws glassy iOS style
buttons, all using CoreGraphics and no images.

Usage
================================

Add the CoolButton.m/.h to your project, create an instance of a
CoolButton, then set the buttonColor like so.

    [myCoolButton setButtonColor:[UIColor blueColor]];

CoolButton takes care of the rest and draws appropriately shaded drop
shadows, gradient, inner shadow, and borders.

Todo
================================

* Set an active state on the button so that it changes when touched
* Fix the border to be an inner glow for more accuracy to the Apple
  buttons
* Make a cooler demo app that shows a whole host of different buttons
  and maybe lets you adjust the button color on the fly via a slider
* Add additional button customization to turn on/off the various
  elements


Copyright
--------------------------------
Copyright (c) 2011 Jess Martin. See LICENSE for details.

