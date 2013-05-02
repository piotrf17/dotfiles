import qualified Codec.Binary.UTF8.String as UTF8
import qualified Data.Map as M
import qualified DBus as D
import qualified DBus.Client as D

import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W

main :: IO()
main = do
    dbus <- D.connectSession
    getWellKnownName dbus
    xmonad $ gnomeConfig {
      workspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "chat"],
      focusedBorderColor = "DarkBlue"
      , modMask          = mod4Mask -- set the mod key to the windows key
      , borderWidth      = 2
      , keys             = \c -> myKeys c `M.union` keys gnomeConfig c
      , manageHook       = myManageHook <+> manageHook gnomeConfig
      , handleEventHook  = fullscreenEventHook
      , logHook          = dynamicLogWithPP (prettyPrinter dbus)
      , layoutHook       = avoidStruts $ smartBorders $ layoutHook gnomeConfig
    }

-- Configure custom keys.
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [ 
  -- use dmenu instead of gnome run
    ((modMask, xK_p), spawn "exe=`dmenu_path | dmenu -b` && eval \"exec $exe\"")
  -- logout of gnome
  , ((modMask .|. shiftMask, xK_q), spawn "gnome-session-quit")
  -- extra workspaces
  , ((mod4Mask, xK_equal), windows $ W.view "chat")
  , ((mod4Mask .|. shiftMask, xK_equal), windows $ W.shift "chat")
  ]

-- Custom window management.
myManageHook = composeAll . concat $
  [ [isFullscreen --> doFullFloat]
  ]

-- A bunch of stuff so that we can output log hook info through dbus.
prettyPrinter :: D.Client -> PP
prettyPrinter dbus = defaultPP
    { ppOutput = dbusOutput dbus
    , ppTitle = pangoSanitize
    , ppCurrent = pangoColor "green" . wrap "[" "]" . pangoSanitize
    , ppVisible = pangoColor "yellow" . wrap "(" ")" . pangoSanitize
    , ppHidden = const ""
    , ppUrgent = pangoColor "red"
    , ppLayout = const ""
    , ppSep = " "
    }

getWellKnownName :: D.Client -> IO ()
getWellKnownName dbus = do
  D.requestName dbus (D.busName_ "org.xmonad.Log")
                [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
  return ()
  
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal (D.objectPath_ "/org/xmonad/Log") 
    	       	 	   (D.interfaceName_ "org.xmonad.Log") 
			   (D.memberName_ "Update")) {
            D.signalBody = [D.toVariant ("<b>" ++ (UTF8.decodeString str) ++ "</b>")]
        }
    D.emit dbus signal

pangoColor :: String -> String -> String
pangoColor fg = wrap left right
  where
    left = "<span foreground=\"" ++ fg ++ "\">"
    right = "</span>"

pangoSanitize :: String -> String
pangoSanitize = foldr sanitize ""
  where
    sanitize '>' xs = "&gt;" ++ xs
    sanitize '<' xs = "&lt;" ++ xs
    sanitize '\"' xs = "&quot;" ++ xs
    sanitize '&' xs = "&amp;" ++ xs
    sanitize x xs = x:xs