import XMonad

import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops


myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1      -- Default number of windows in the master pane
    ratio   = 1/2    -- Default proportion of screen occupied by master pane
    delta   = 3/100  -- Percent of screen to increment by when resizing panes

main :: IO ()
-- main = xmonad $ ewmhFullscreen $ ewmh $ def
main = xmonad $ ewmh $ myConfig

myConfig = def
      { modMask = mod4Mask  -- Rebind Mod to the Super key
      , layoutHook=myLayout -- Use custom layouts
      }
      `additionalKeysP`
      [ ("M-S-z", spawn "xscreensaver-command -lock")
      , ("M-S-=", unGrab *> spawn "scrot -s"        )
      , ("M-]"  , spawn "firefox"                   )
      ]

