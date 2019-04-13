import XMonad

import Data.Monoid
import System.Exit
import System.IO

import Graphics.X11
import Graphics.X11.Xinerama

import XMonad.Layout.Spacing
import XMonad.Layout.Cross
import XMonad.Layout.Circle
import XMonad.Layout.LayoutModifier
import XMonad.Layout.PerWorkspace
import XMonad.Layout.NoBorders
import XMonad.Layout.MagicFocus
import XMonad.Layout.Grid
import XMonad.Layout.CenteredMaster
import XMonad.Layout.Magnifier
import XMonad.Layout.Accordion
import XMonad.Layout.SimpleFloat

import XMonad.Util.EZConfig
import XMonad.Util.WorkspaceCompare
--import XMonad.Util.Run (spawnPipe)

--import Xmonad.Hooks.WorkspaceHistory --(workspaceHistoryHook)
--import Xmonad.Hooks.WorkspaceByPos

import qualified Data.Map as M
--import XMonad.Promt
--import Xmonad.Promt.Shell
--import XMonad.Promt.XMonad
import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.NoBorders
import XMonad.Actions.FloatKeys

--keys XConfig Layout -> M.Map (ButtonMask, KeySum) (X ())
main :: IO ()
main = do
   xmonad $ def
    { terminal    = myTerminal
    , modMask     = myModMask
    , focusFollowsMouse = myFocusFollowsMouse
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , layoutHook = myLayout
    , workspaces = myWorkspaces
--    , keys = myKeys
    , keys = myKeys <+> keys def
--    , logHook = workspaceHistoryHook
    }

myTerminal    = "urxvt"
myModMask     = mod4Mask
myFocusFollowsMouse = False 
myBorderWidth = 1
myNormalBorderColor = "#0f0f0f"
myFocusedBorderColor = "#3d3d3d"

myWorkspaces = ["1-main","2-work","3-geany","4-web","5-media","6-stars","7-compile","8-mpd","9-mplayer"]


--
myLayout = onWorkspace "5-media" Full $ onWorkspace "8-mpd" Circle $ onWorkspace "9-mplayer" simpleFloat (simpleCross ||| magicFocus (Tall 1 (3/100) (1/2)) ||| tiled ||| centerMaster tiled ||| magnifier (Tall 1 (3/100) (1/2)) ||| Full)
  where
     --
     --m1 = magnifier (Tall 1 (3/100) (1/2))
     tiled   = spacing 1 $ Tall nmaster delta ratio
     nmaster = 1
     ratio   = 3/5
     delta   = 2/100



-- Определить макет для конкретных рабочих областей (без контура)
nobordersLayout = noBorders $ Full

-- keybind

-- action-cyclews
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

  [    ((modm .|. controlMask, xK_Left),  prevWS)
     , ((modm .|. controlMask, xK_Right), nextWS)
     , ((modm, xK_g), withFocused toggleBorder)
     , ((modm, xK_d), withFocused (keysResizeWindow (-10,-10) (1,1)))
     , ((modm, xK_s), withFocused (keysResizeWindow (10,10) (1,1)))
     , ((modm .|. shiftMask, xK_d), withFocused (keysAbsResizeWindow (-10,-10) (1440,884)))
     , ((modm .|. shiftMask, xK_s), withFocused (keysAbsResizeWindow (10,10) (1440,884)))
     , ((modm, xK_a), withFocused (keysMoveWindowTo (720,450) (1/2,1/2)))
--     , ((modm .|. controlMask, xK_Return), dwmpromote)
  ]
