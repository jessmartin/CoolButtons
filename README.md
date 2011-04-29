CoolButtons
================================

CoolButtons is a subclass of UIButton that draws glassy iOS style
buttons, all using CoreGraphics and no images.

![Button Comparison](https://github.com/jessmartin/CoolButtons/raw/master/button_comparison.png)

Usage
================================

Add the CoolButton.m/.h to your project, create an instance of a
CoolButton, then set the buttonColor like so.

    [myCoolButton setButtonColor:[UIColor blueColor]];

CoolButton takes care of the rest and draws appropriately shaded drop
shadows, gradient, inner shadow, and borders.

Todo
================================

* Fix the border to be an inner glow for more accuracy to the Apple
  buttons
* Add additional button customization to turn on/off the various design
  elements


Copyright
--------------------------------
Copyright (c) 2011 Jess Martin. See LICENSE for details.

