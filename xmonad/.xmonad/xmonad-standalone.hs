import qualified Data.Map as M
import System.IO

import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe, runProcessWithInput)
import System.Taffybar.Hooks.PagerHints

--  xmonad $ ewmh $ pagerHints $ defaultConfig {

main :: IO ()
main = do
  xmonad $ ewmh $ pagerHints $ docks def {
      workspaces           = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "chat"]
    , focusedBorderColor = "DarkBlue"
    , modMask            = mod4Mask  -- Rebind mod key to the windows key
    , borderWidth        = 2
    , keys               = \c -> myKeys c `M.union` keys defaultConfig c
    , manageHook         = manageDocks <+> myManageHook <+> manageHook def
    , handleEventHook    = fullscreenEventHook
    , layoutHook         = avoidStruts $ smartBorders $ layoutHook def
    , terminal           = "gnome-terminal"
    }


-- Custom window management.
myManageHook = composeAll . concat $
  [ [isFullscreen --> doFullFloat]
  ]

-- Configure custom keys.
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ 
  -- use dmenu instead of gnome run
    ((modMask, xK_p), spawn "exe=`dmenu_run -b` && eval \"exec $exe\"")
  -- lock screen
  , ((controlMask .|. mod1Mask, xK_l), spawn "slock")
  -- extra workspaces
  , ((modMask, xK_equal), windows $ W.view "chat")
  , ((modMask .|. shiftMask, xK_equal), windows $ W.shift "chat")
  , ((modMask, xK_q), spawn "killall -9 taffybar-linux-x86_64; xmonad --recompile && xmonad --restart")
  , ((modMask, xK_b), sendMessage ToggleStruts)

  -- Volume control for Thinkpad hardware buttons
  , ((0, 0x1008ff13), spawn "amixer set Master 3%+")
  , ((0, 0x1008ff11), spawn "amixer set Master 3%-")
  , ((0, 0x1008ff12), spawn "amixer set Master toggle")
  --XF86MonBrightnessDown
  , ((0, 0x1008ff03), spawn "xbacklight -dec 10")
  --XF86MonBrightnessUp
  , ((0, 0x1008ff02), spawn "xbacklight -inc 10")
  ]
