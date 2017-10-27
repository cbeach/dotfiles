import XMonad
 
import System.Exit
import System.IO
import System.IO

import XMonad.Actions.CycleWS

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.Grid
import XMonad.Layout.GridVariants
import XMonad.Layout.IM
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders (smartBorders, noBorders)
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing

import XMonad.Operations

import XMonad.Prompt
import XMonad.Prompt.AppendFile (appendFilePrompt)
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)

import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run
 
import Data.Ratio ((%))
 
import qualified XMonad.StackSet as W
import qualified Data.Map as M

import XMonad.Config.Gnome

main = do
    xmonad $ gnomeConfig { 
        focusedBorderColor  = colorFocusedBorder,
        borderWidth         = 2,
       --- manageHook          = manageDocks <+> manageHook defaultConfig, 
        layoutHook          = avoidStruts (layoutHook defaultConfig ||| SplitGrid XMonad.Layout.GridVariants.L 1 1 (1/4) (16/10) (5/100))
    } 
colorFocusedBorder  = "#0000FF"
startupHook = setWMName "LG3D"
