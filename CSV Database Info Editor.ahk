#NoEnv
SetBatchLines, -1
OnExit("KillIE")
 
; Dialog Box
Gui, Dialog:New, -SysMenu +AlwaysOnTop, Wrong Link
Gui, Dialog:Add, Combobox, vGameLink
Gui, Dialog:Add, Button, Default gDialogProceed, Continue
 
; Predefined values ----------------------------------------------------------------------------------------------------------------
GuiTitle := "Game Info Editor"         ; main Gui title
FileDir := A_ScriptDir . "\CSVFILES"   ; path of the folder containing the files
;FileDir := "C:\Users\"A_UserName "\Google Drive\Csv Files"   ; path of the folder containing the files for google drive
DataDir := ".\Data"
FileEncoding, UTF-8
Separator := ">"                       ; field separator
NumOfFields := 10                      ; number of fields in the game records
FieldNames  := ["Rom Name"             ; array of field names for the game record, adjust them to your needs
              , "Game Name"
              , "Year"
              , "Rating"
              , "Publisher"
              , "Developer"
              , "Genre"
              , "Score"
              , "Number Of Players"
              , "Description"]
FieldOptions := ["Disabled"            ; special Gui options for the edit fields, adjust them to your needs
               , ""
               , ""
               , ""
               , ""
               , ""
               , ""
               , ""
               , ""
               , "r10"
               , ""
               , ""]
 
LVW := 300                       ; width of the ListView controls
EDW := 500                       ; width of the Edit controls
 
CurrentFields := [], GameArray := {}
  FileMove, .\Data\acorn32bit.xml, .\Data\Acorn 32Bit.xml
 FileMove, .\Data\alice3290.xml, .\Data\Alice 32-90.xml
 FileMove, .\Data\amiga.xml, .\Data\Commodore Amiga.xml
 FileMove, .\Data\amigacd32.xml, .\Data\Commodore Amiga CD32.xml
 FileMove, .\Data\amstradcpc.xml, .\Data\Amstrad CPC.xml
 FileMove, .\Data\amstradpcw.xml, .\Data\Amstrad PCW.xml
 FileMove, .\Data\android.xml, .\Data\Android.xml
 FileMove, .\Data\appleii.xml, .\Data\Apple II.xml
 FileMove, .\Data\appleiigs.xml, .\Data\Apple IIGS.xml
 FileMove, .\Data\arcade.xml, .\Data\Arcade.xml
 FileMove, .\Data\arcadia2001.xml, .\Data\Emerson Arcadia-2001.xml
 FileMove, .\Data\atari2600.xml, .\Data\Atari 2600.xml
 FileMove, .\Data\atari5200.xml, .\Data\Atari 5200.xml
 FileMove, .\Data\atari7800.xml, .\Data\Atari 7800.xml
 FileMove, .\Data\atari8bit.xml, .\Data\Atari  8-Bit.xml
 FileMove, .\Data\atarist.xml, .\Data\Atari ST.xml
 FileMove, .\Data\atom.xml, .\Data\Acorn Atom.xml
 FileMove, .\Data\bada.xml, .\Data\Bada.xml
 FileMove, .\Data\ballyastrocade.xml, .\Data\Bally Astrocade.xml
 FileMove, .\Data\bbcmicro.xml, .\Data\Acorn BBC Micro.xml
 FileMove, .\Data\beos.xml, .\Data\BeOS.xml
 FileMove, .\Data\blackberry.xml, .\Data\BlackBerry.xml
 FileMove, .\Data\bluraydiscplayer.xml, .\Data\Blu-Ray Disc Player.xml
 FileMove, .\Data\brew.xml, .\Data\Brew.xml
 FileMove, .\Data\browser.xml, .\Data\Browser.xml
 FileMove, .\Data\camputerslynx.xml, .\Data\Camputers Lynx.xml
 FileMove, .\Data\casioloopy.xml, .\Data\Casio Loopy.xml
 FileMove, .\Data\casiopv1000.xml, .\Data\Casio PV-1000.xml
 FileMove, .\Data\cdi.xml, .\Data\Philips CD-i.xml
 FileMove, .\Data\cdtv.xml, .\Data\Commodoe CDTV.xml
 FileMove, .\Data\channelf.xml, .\Data\Fairchild Channel-F.xml
 FileMove, .\Data\colecoadam.xml, .\Data\Coleco ADAM.xml
 FileMove, .\Data\colecovision.xml, .\Data\ColecoVision.xml
 FileMove, .\Data\commodore128.xml, .\Data\Commodore 128.xml
 FileMove, .\Data\commodore16plus4.xml, .\Data\Commodore 16 Plus4.xml
 FileMove, .\Data\commodore64.xml, .\Data\Commodore 64.xml
 FileMove, .\Data\commodorepetcbm.xml, .\Data\Commodoe Pet – CBM.xml
 FileMove, .\Data\digiblast.xml, .\Data\DigiBlast.xml
 FileMove, .\Data\doja.xml, .\Data\Doja.xml
 FileMove, .\Data\dos.xml, .\Data\DOS.xml
 FileMove, .\Data\dragon3264.xml, .\Data\Dragon 32 - 64.xml
 FileMove, .\Data\dreamcast.xml, .\Data\Sega Dreamcast.xml
 FileMove, .\Data\dvdplayer.xml, .\Data\Dvd Player.xml
 FileMove, .\Data\electron.xml, .\Data\Acorn Electron.xml
 FileMove, .\Data\enterprise.xml, .\Data\Enterprise.xml
 FileMove, .\Data\epochcassettevision.xml, .\Data\Epoch Cassette Vision.xml
 FileMove, .\Data\epochgamepocketcomputer.xml, .\Data\Epoch Game Pocket Computer.xml
 FileMove, .\Data\epochsupercassettevision.xml, .\Data\Epoch Super Cassette Vision.xml
 FileMove, .\Data\exelvision.xml, .\Data\Exelvision EXL 100.xml
 FileMove, .\Data\exen.xml, .\Data\ExEn.xml
 FileMove, .\Data\exidysorcerer.xml, .\Data\Exidy Sorcerer.xml
 FileMove, .\Data\fireos.xml, .\Data\Fire OS.xml
 FileMove, .\Data\fm7.xml, .\Data\Fujitsu FM-7.xml
 FileMove, .\Data\fmtowns.xml, .\Data\Fujitsu-FM Towns.xml
 FileMove, .\Data\gameboy.xml, .\Data\Nintendo Game Boy.xml
 FileMove, .\Data\gameboyadvance.xml, .\Data\Nintendo Game Boy Advance.xml
 FileMove, .\Data\gameboycolor.xml, .\Data\Nintendo Game Boy Color.xml
 FileMove, .\Data\gamecom.xml, .\Data\Tiger Game.com.xml
 FileMove, .\Data\gamecube.xml, .\Data\Nintendo GameCube.xml
 FileMove, .\Data\gamegear.xml, .\Data\Sega Game Gear.xml
 FileMove, .\Data\gamestick.xml, .\Data\GameStick.xml
 FileMove, .\Data\gamewave.xml, .\Data\Game Wave.xml
 FileMove, .\Data\genesis.xml, .\Data\Sega Genesis.xml
 FileMove, .\Data\gizmondo.xml, .\Data\Gizmondo.xml
 FileMove, .\Data\gp2x.xml, .\Data\GP2X.xml
 FileMove, .\Data\gp2xwiz.xml, .\Data\GP2X Wiz.xml
 FileMove, .\Data\gp32.xml, .\Data\GamePark 32.xml
 FileMove, .\Data\hddvdplayer.xml, .\Data\HD Dvd Player.xml
 FileMove, .\Data\hyperscan.xml, .\Data\HyperScan.xml
 FileMove, .\Data\intellivision.xml, .\Data\Mattel Intellivision.xml
 FileMove, .\Data\ipad.xml, .\Data\Apple iPad.xml
 FileMove, .\Data\iphone.xml, .\Data\Apple iPhone.xml
 FileMove, .\Data\ipodclassic.xml, .\Data\Apple iPod Classic.xml
 FileMove, .\Data\j2me.xml, .\Data\J2ME.xml
 FileMove, .\Data\jaguar.xml, .\Data\Atari Jaguar.xml
 FileMove, .\Data\jupiterace.xml, .\Data\Jupiter Ace.xml
 FileMove, .\Data\kindleclassic.xml, .\Data\Kindle Classic.xml
 FileMove, .\Data\laseractive.xml, .\Data\LaserActive.xml
 FileMove, .\Data\leapster.xml, .\Data\LeapFrog Leapster.xml
 FileMove, .\Data\linux.xml, .\Data\Linux.xml
 FileMove, .\Data\lynx.xml, .\Data\Atari Lynx.xml
 FileMove, .\Data\macintosh.xml, .\Data\Macintosh.xml
 FileMove, .\Data\maemo.xml, .\Data\Maemo.xml
 FileMove, .\Data\mattelaquarius.xml, .\Data\Mattel Aquarius.xml
 FileMove, .\Data\meego.xml, .\Data\MeeGo.xml
 FileMove, .\Data\memotechmtx.xml, .\Data\MemoTech MTX.xml
 FileMove, .\Data\microvision.xml, .\Data\Microvision.xml
 FileMove, .\Data\mophun.xml, .\Data\Mophun.xml
 FileMove, .\Data\msx.xml, .\Data\Microsoft MSX.xml
 FileMove, .\Data\nascom.xml, .\Data\Nascom.xml
 FileMove, .\Data\neogeo.xml, .\Data\Neo Geo.xml
 FileMove, .\Data\neogeocd.xml, .\Data\Neo Geo CD.xml
 FileMove, .\Data\neogeopocket.xml, .\Data\Neo Geo Pocket.xml
 FileMove, .\Data\neogeopocketcolor.xml, .\Data\Neo Geo Pocket Color.xml
 FileMove, .\Data\nes.xml, .\Data\Nintendo Entertainment System.xml
 FileMove, .\Data\newbrain.xml, .\Data\Grundy NewBrain.xml
 FileMove, .\Data\newnintendo3ds.xml, .\Data\New Nintendo 3DS.xml
 FileMove, .\Data\ngage.xml, .\Data\N-Gage.xml
 FileMove, .\Data\ngageservice.xml, .\Data\N-Gage 2.0.xml
 FileMove, .\Data\nintendo3ds.xml, .\Data\Nintendo 3DS.xml
 FileMove, .\Data\nintendo64.xml, .\Data\Nintendo 64.xml
 FileMove, .\Data\nintendods.xml, .\Data\Nintendo Ds.xml
 FileMove, .\Data\nintendodsi.xml, .\Data\Nintendo Dsi.xml
 FileMove, .\Data\nuon.xml, .\Data\VM Labs Nuon.xml
 FileMove, .\Data\odyssey.xml, .\Data\Magnavox Odyssey.xml
 FileMove, .\Data\odyssey2.xml, .\Data\Magnavox Odyssey.xml
 FileMove, .\Data\ohioscientific.xml, .\Data\Ohio Scientific.xml
 FileMove, .\Data\oric.xml, .\Data\Tangerine Oric.xml
 FileMove, .\Data\os2.xml, .\Data\OS/2.xml
 FileMove, .\Data\ouya.xml, .\Data\OUYA.xml
 FileMove, .\Data\palmos.xml, .\Data\Palm Os.xml
 FileMove, .\Data\3do.xml, .\Data\Panasoni 3DO.xml
 FileMove, .\Data\pc6001.xml, .\Data\NEC PC-6001.xml
 FileMove, .\Data\pc88.xml, .\Data\NEC PC-8801.xml
 FileMove, .\Data\pc98.xml, .\Data\NEC PC-9801.xml
 FileMove, .\Data\pcbooter.xml, .\Data\PC Booter.xml
 FileMove, .\Data\pcfx.xml, .\Data\NEC PC-FX.xml
 FileMove, .\Data\philipsvg5000.xml, .\Data\Philips VG 5000.xml
 FileMove, .\Data\pippin.xml, .\Data\Apple BanDai Pippin.xml
 FileMove, .\Data\playdia.xml, .\Data\BanDai Playdia.xml
 FileMove, .\Data\playstation.xml, .\Data\Sony Playstation.xml
 FileMove, .\Data\playstation2.xml, .\Data\Sony Playstation 2.xml
 FileMove, .\Data\playstation3.xml, .\Data\Sony Playstation 3.xml
 FileMove, .\Data\playstation4.xml, .\Data\Sony Playstation 4.xml
 FileMove, .\Data\pokmonmini.xml, .\Data\Nintendo Pokemon Mini.xml
 FileMove, .\Data\psp.xml, .\Data\Sony PSP.xml
 FileMove, .\Data\psvita.xml, .\Data\Sony PS-Vita.xml
 FileMove, .\Data\rcastudioii.xml, .\Data\RCA Studio II.xml
 FileMove, .\Data\roku.xml, .\Data\Roku.xml
 FileMove, .\Data\samcoup.xml, .\Data\MGT Sam Coupe.xml
 FileMove, .\Data\sega32x.xml, .\Data\Sega 32x.xml
 FileMove, .\Data\segacd.xml, .\Data\Sega CD.xml
 FileMove, .\Data\segamastersystem.xml, .\Data\Sega Master System.xml
 FileMove, .\Data\segapico.xml, .\Data\Sega Pico.xml
 FileMove, .\Data\segasaturn.xml, .\Data\Sega Saturn.xml
 FileMove, .\Data\sg1000.xml, .\Data\Sega SG-1000.xml
 FileMove, .\Data\sharpmz80b20002500.xml, .\Data\Sharp MZ-80B .xml
 FileMove, .\Data\sharpmz80k7008001500.xml, .\Data\Sharp Mz-80K.xml
 FileMove, .\Data\sharpx1.xml, .\Data\Sharp X1.xml
 FileMove, .\Data\sharpx68000.xml, .\Data\Sharp X68000.xml
 FileMove, .\Data\sinclairql.xml, .\Data\Sinclair QL.xml
 FileMove, .\Data\snes.xml, .\Data\Super Nintendo Entertainment System.xml
 FileMove, .\Data\sordm5.xml, .\Data\Sord M5.xml
 FileMove, .\Data\spectravideo.xml, .\Data\SpectraVideo.xml
 FileMove, .\Data\superacan.xml, .\Data\Super A'Can.xml
 FileMove, .\Data\supergrafx.xml, .\Data\Nec SuperGrapx.xml
 FileMove, .\Data\supervision.xml, .\Data\Watar SuperVision.xml
 FileMove, .\Data\symbian.xml, .\Data\Symbian OS.xml
 FileMove, .\Data\tads.xml, .\Data\T.A.D.S.xml
 FileMove, .\Data\tatungeinstein.xml, .\Data\Tatung Einstein.xml
 FileMove, .\Data\thomsonmo.xml, .\Data\Thomson MO.xml
 FileMove, .\Data\thomsonto.xml, .\Data\Thomson TO.xml
 FileMove, .\Data\ti994a.xml, .\Data\Texas Instruments TI 99-4A.xml
 FileMove, .\Data\timexsinclair2068.xml, .\Data\Timex Sinclair 2068.xml
 FileMove, .\Data\tomytutor.xml, .\Data\Tomy Tutor.xml
 FileMove, .\Data\trs80.xml, .\Data\Tandy TRS-80.xml
 FileMove, .\Data\trs80coco.xml, .\Data\Tandy TRS-80 Color.xml
 FileMove, .\Data\trs80mc10.xml, .\Data\Tandy TRS-80 MC-10.xml
 FileMove, .\Data\turbografx16.xml, .\Data\NEC TurboGrapx-16.xml
 FileMove, .\Data\turbografxcd.xml, .\Data\NEC TurboGrapx-CD.xml
 FileMove, .\Data\tvos.xml, .\Data\TvOS.xml
 FileMove, .\Data\vectrex.xml, .\Data\GCE Vectrex.xml
 FileMove, .\Data\vic20.xml, .\Data\Commodore Vic-20.xml
 FileMove, .\Data\videopacg7400.xml, .\Data\Videopac+ G7400.xml
 FileMove, .\Data\virtualboy.xml, .\Data\Nintendo Virtual Boy.xml
 FileMove, .\Data\vis.xml, .\Data\Memorex VIS.xml
 FileMove, .\Data\vsmile.xml, .\Data\VTech V.Smile.xml
 FileMove, .\Data\watchos.xml, .\Data\WatchOS.xml
 FileMove, .\Data\webos.xml, .\Data\WebOS.xml
 FileMove, .\Data\wii.xml, .\Data\Nintendo Wii.xml
 FileMove, .\Data\wiiu.xml, .\Data\Nintendo WiiU.xml
 FileMove, .\Data\windows3x.xml, .\Data\Windows 3x.xml
 FileMove, .\Data\windowsapps.xml, .\Data\Windows Apps.xml
 FileMove, .\Data\windowsmobile.xml, .\Data\Windows Mobile.xml
 FileMove, .\Data\windowsphone.xml, .\Data\Windows Phone.xml
 FileMove, .\Data\windows_part1.xml, .\Data\.xml
 FileMove, .\Data\windows_part2.xml, .\Data\.xml
 FileMove, .\Data\wonderswan.xml, .\Data\BanDai WonderSwan.xml
 FileMove, .\Data\wonderswancolor.xml, .\Data\BanDai WonderSwan Color.xml
 FileMove, .\Data\xbox.xml, .\Data\Microsoft Xbox.xml
 FileMove, .\Data\xbox360.xml, .\Data\Microsoft Xbox 360.xml
 FileMove, .\Data\xboxone.xml, .\Data\Microsoft Xbox One.xml
 FileMove, .\Data\zeebo.xml, .\Data\Zeebo.xml
 FileMove, .\Data\zmachine.xml, .\Data\Z-Machine.xml
 FileMove, .\Data\zodiac.xml, .\Data\TapWave Zodiac.xml
 FileMove, .\Data\zx80.xml, .\Data\Sinclair ZX80.xml
 FileMove, .\Data\zx81.xml, .\Data\Sinclair ZX81.xml
 FileMove, .\Data\zxspectrum.xml, .\Data\Sinclair ZX Spectrum.xml

; Get the height of a single-line edit control -------------------------------------------------------------------------------------
Gui, New
Gui, Add, Edit, vDummy, Dummy
GuiControlGet, Dummy, Pos
EDH := DummyH
Gui, Destroy
 
; GUI ------------------------------------------------------------------------------------------------------------------------------
Gui, 1:New, , %GuiTitle%
Gui, font, s13, Arial
Gui, Margin, 20, 10
 
; Create and populate the FileLV
Gui, Add, ListView, w%LVW% r10 Sort -Multi vFileLV gSubFileLV, File Name
Loop, Files, %FileDir%\*.csv
	LV_Add("", A_LoopFileName)
 
; Create the GameLV
Gui, Add, ListView, w%LVW% h300 r10 Sort -Multi vGameLV gSubGameLV AltSubmit, % FieldNames[1]
 
; Add the text and edit fields for the game records
TXY := "ym"
Loop, %NumOfFields% {
	Gui, Add, Checkbox, Checked Section %TXY% vCH%A_Index% h%EDH%, % FieldNames[A_Index]
	;Gui, Add, Text, xp+15 h%EDH% +0x200, % FieldNames[A_Index]
	Options := FieldOptions[A_Index] ; special field options
	Gui, Add, Edit, y+2 w%EDW% %Options% vED%A_Index% gSubEditChanged +ReadOnly
	TXY := "y+2"
}
 
; Create and populate the MobySysLV
Gui, Add, ListView, ym w%LVW% r10 Sort -Multi vMobySysLV gSubMobySysLV, System Name
Loop, Files, %DataDir%\*.xml
	LV_Add("", A_LoopFileName)
 
; Create the MobyGameLV
Gui, Add, ListView, w%LVW% r10 Sort -Multi vMobyGameLV gSubMobyGameLV AltSubmit, % FieldNames[1]
 
; Add the action buttons
BC := 4 ; button count
BW := 100 ; button width
DX := (EDW - (BW * BC)) // (BC - 1) ; space between butons
Gui, Add, Button, xs w%BW% vEditBtn gSubEditBtn, Edit
Gui, Add, Button, x+%DX% yp wp Disabled vSaveBtn gSubSaveBtn, Save
Gui, Add, Button, x+%DX% yp wp Disabled vCancelBtn gSubCancelBtn, Cancel
Gui, Add, Button, x+%DX% yp wp gSubSearch , Google
 
 
;------add background image here---------------------------------------------------------
; Adjust the height of GameLV
GuiControlGet, L, Pos, MobyGameLV
GuiControlGet, L, Pos, GameLV
GuiControlGet, B, Pos, CancelBtn
LVH := BH + BY - LY
GuiControl, Move, GameLV, h%LVH%
GuiControl, Move, MobyGameLV, h%LVH%
; Show the GUI
Gui, Show
Editing := False
 
Gui, Dialog:+Owner
 
Return
 
F5::Goto, SubScrapeBtn
 
GuiClose:
	ExitApp
 
 
; File LV label --------------------------------------------------------------------------------------------------------------------
SubFileLV:
	Gui, ListView, FileLV ; set the default ListView
	if(A_GuiEvent = "DoubleClick") && (A_EventInfo) && (LV_GetNext() = A_EventInfo)  { ; double-click on an item
		LV_GetText(CurrentFile, A_EventInfo)
 
		PopulateGameLV(CurrentFile)
 
		GuiControl, Focus, GameLV
		;LV_Modify(1, "Select")
	}
Return
 
PopulateFileLV(){
	Global
	Gui, ListView, FileLV
	LV_Delete()
	GuiControl, -ReDraw, FileLV ; stop redrawing
 
	Loop, Files, %FileDir%\*.csv
		LV_Add("", A_LoopFileName)
 
	Loop, 2 { ; adjust the column width
		LV_ModifyCol(A_Index, "AutoHdr")
	}
	GuiControl, +Redraw, FileLV ; redraw the ListView
}
 
PopulateGameLV(FileName){
	Global
	Gui, ListView, GameLV ; change the default ListView
	LV_Delete()
	GuiControl, -ReDraw, GameLV ; stop redrawing
	FileRead, CurrentContent, %FileDir%\%FileName%
	GameArray := []
	Loop, Parse, CurrentContent, `n, `r
	{
		If (A_LoopField) {
			Fields := StrSplit(A_LoopField, Separator)   ; creates a real array of fields (AHK arrays start with index 1)
			GameID := Fields[2]                          ; use the first field as the unique ID for the game
			LV_Add("", GameID)                           ; add GameID
			GameArray[GameID] := Fields                  ; use GameID as key for GameArray
		}
	}
	Loop, 2 { ; adjust the column width
		LV_ModifyCol(A_Index, "AutoHdr")
	}
	GuiControl, +Redraw, GameLV ; redraw the ListView
}
 
 
; Game LV label --------------------------------------------------------------------------------------------------------------------
SubGameLV:
	Gui, ListView, GameLV ; set the default ListView
	if(A_GuiEvent == "I")&& Instr(ErrorLevel, "S", 1) { ; a new item has been selected
		LV_GetText(CurrentGame, A_EventInfo)
		CurrentFields := GameArray[CurrentGame].Clone() ; retrieve the fields of the selected game from GameArray
		Loop, %NumOfFields% { ; update the edit fields
			GuiControl, , ED%A_Index%, % RegExReplace(CurrentFields[A_Index], "¤", "`n")
		}
	}
Return
 
 
SubMobySysLV:
	Gui, ListView, MobySysLV ; set the default ListView
	if(A_GuiEvent = "DoubleClick") && (A_EventInfo) { ; double-click on an item
		LV_GetText(MobyFileName, A_EventInfo)
 
		;SplitPath, MobyFileName, , , , FileName
 
		;PopulateGameLV(MobyFileName ".csv")
 
		Gui, ListView, MobyGameLV ; change the default ListView
		LV_Delete()
		GuiControl, -ReDraw, MobyGameLV ; stop redrawing
		FileRead, CurrentContent, %DataDir%\%MobyFileName%
		MobyArray := [] ; initialize a real array to hold the lines
 
		Loop, Parse, CurrentContent, `n, `r
		{
			RegExMatch(A_LoopField, "(?<=<loc>).*?(?=</loc>)", URL)
			if(URL) {
				SplitPath, URL, GameID
				GameID := Format("{:T}", RegExReplace(GameID, "(_|-)+", " "))
				LV_Add("", GameID)                          ; add GameID
				MobyArray[GameID] := URL                  	; use GameID as key for MobyArray
			}
	   }
	   Loop, 2 ; adjust the column width
			LV_ModifyCol(A_Index, "AutoHdr")
	   GuiControl, +Redraw, MobyGameLV ; redraw the ListView
	   GuiControl, Focus, MobyGameLV
	   ;LV_Modify(1, "Select")
	}
Return
 
PopulateMobySysLV(){
	Global
	Gui, ListView, MobySysLV
	LV_Delete()
	GuiControl, -ReDraw, MobySysLV ; stop redrawing
 
	Loop, Files, %DataDir%\*.xml
	{
		LV_Add("", A_LoopFileName)
	}
	Loop, 2 { ; adjust the column width
		LV_ModifyCol(A_Index, "AutoHdr")
	}
	GuiControl, +Redraw, MobySysLV ; redraw the ListView
}
 
; Game LV label --------------------------------------------------------------------------------------------------------------------
SubMobyGameLV:
	Gui, ListView, MobyGameLV ; set the default ListView
	if(A_GuiEvent = "DoubleClick") && (A_EventInfo) { ; a new item has been selected
		LV_GetText(CurrentMobyGame, A_EventInfo)
 
		Navigate(MobyArray[CurrentMobyGame])
 
		Title := WB.document.getElementsByClassName("niceHeaderTitle")[0].getElementsByTagName("a")[0].innerText
 
		coreGameRelease := RegExReplace(WB.document.getElementById("coreGameRelease").innerText, "(`n|`r)+", "`n")
		coreGameGenre := RegExReplace(WB.document.getElementById("coreGameGenre").innerText, "(`n|`r)+", "`n")
		coreGameRank := RegExReplace(WB.document.getElementById("coreGameRank").innerText, "(`n|`r)+", "`n")
 
		RegExMatch(coreGameRelease, "(?<=Published by`n)[^`n]*", Publisher)
		RegExMatch(coreGameRelease, "(?<=Developed by`n)[^`n]*", Developer)
		RegExMatch(coreGameRelease, "(?<=Released`n)[^`n]*", Released)
 
		RegExMatch(coreGameGenre, "(?<=ESRB Rating`n)[^`n]*", Rating)
		RegExMatch(coreGameGenre, "(?<=Genre`n)[^`n]*", Genre)
 
		RegExMatch(coreGameRank, "\d*(?=`nCritic Score)", Critic)
		RegExMatch(coreGameRank, "(\d|\.)*(?=`nUser Score)", User)
 
		RegExMatch(WB.document.getElementsByClassName("col-md-8 col-lg-8")[0].innerText, "s)(?<=Description`r`n).*?(?=\s+\[edit description)", Description)
 
		Navigate(MobyArray[CurrentMobyGame] "/techinfo")
 
		techInfo := RegExReplace(WB.document.getElementsByClassName("techInfo")[0].innerText, "(`n|`r)+", "`n")
 
		RegExMatch(techInfo, "(?<=Number of Players Supported)[^`n`r]*", Players)
 
		Gui, Submit, NoHide
 
		UpdateField(2, Title)
		UpdateField(3, Released)
		UpdateField(4, Rating)
		UpdateField(5, Publisher)
		UpdateField(6, Developer)
		UpdateField(7, Genre)
		UpdateField(8, User)
		UpdateField(9, Players)
		UpdateField(10, Description)
 
		if(Title){
			;PopulateGameLV(MobyFileName ".csv")
			;CurrentFile := MobyFileName
			GuiControl, 1:Enable, SaveBtn
			Goto, SubEditBtn
		}
	}
Return
 
UpdateField(index, text){
	GuiControlGet, bool, , CH%index%
	if(!bool) {
		GuiControl, , ED%index%, % text ? text : "..."
	}
}
 
 
Navigate(url){
	Global WB
	if(!WB){
		WB := ComObjCreate("InternetExplorer.Application")
		;WB.Visible := True
		;Sleep, 100
		;WB.Visible := False
	}
	WB.Navigate(url)
	While, WB.ReadyState != 4 ;Wait for page to load
		continue
	if(WB.document.Title = "{gameTitle} for {gamePlatform} ({gameYear}) - MobyGames"){
		ComboDialog(url)
	}
}
 
ComboDialog(url){
	Global
	links := WB.document.getElementById("main").getElementsByTagName("a")
	list := ""
 
	loop, % links.length
	{
		RegExMatch(links[A_Index - 1].getAttribute("href"), "[^/]*$", game)
		list .= (A_Index = 2 ? "||" : "|") game
	}
 
	Gui, +Disabled
 
	GuiControl, Dialog:, GameLink, %list%
	Gui, Dialog:Show, AutoSize
 
	loop {
		GuiControlGet, Visible, Dialog:Visible, GameLink
		if(!Visible){
			Break
		}
		Sleep, 50
	}
 
	Gui, -Disabled
 
	SplitPath, url, , link
	MobyArray[CurrentMobyGame] := link "/" GameLink
	Navigate(link "/" GameLink)
}
 
DialogProceed:
	Gui, Dialog:Submit
	Gui, -Disabled
return
 
SubScrapeBtn:
	Gui, ListView, MobySysLV
	LV_Delete()
 
	IfNotExist, %dataDir%
		FileCreateDir, %dataDir%
 
	UrlDownloadToFile, http://www.mobygames.com/images/sitemap/sitemap_index.xml, %DataDir%\sitemap.txt
 
	Loop, Read, %DataDir%\sitemap.txt
	{
		RegExMatch(A_LoopReadLine, "(?<=<loc>).*?(?=</loc>)", URL)
		SplitPath, URL, name
		name := RegExReplace(name, "(sitemap_|_games)")
		UrlDownloadToFile, %URL%, %DataDir%\%name%
	}
	PopulateMobySysLV()
return
 
;Google Search button label --------------------------------------------------------------------------------------------------------
SubSearch:
	StringTrimRight, NameNoExt, CurrentFile, 4
	googleterms := NameNoExt . "+" . CurrentFields[2]
	run, http://www.google.com/search?q=%googleterms%
Return ; important to end the label!!!
 
; Edit button label ----------------------------------------------------------------------------------------------------------------
SubEditBtn:
	;GuiControl, Disable, FileLV
	GuiControl, Disable, GameLV
	GuiControl, Disable, EditBtn
	Loop, %NumOfFields%
		GuiControl, -ReadOnly, ED%A_Index%
	GuiControl, Enable, CancelBtn
	GuiControl, Focus, ED2
	Modified := False
	Editing := True
Return
 
; Save button label ----------------------------------------------------------------------------------------------------------------
SubSaveBtn:
	Gui, +OwnDialogs
	Editing := False
	SplitPath, CurrentFile, , , , FileName
	MsgBox, 4, %GuiTitle%, Save the changes to file %FileName%.csv ?
	IfMsgBox, Yes
	{
		Gui, Submit, NoHide
		Loop, %NumOfFields% { ; update the game record
			GuiControlGet, Value, , ED%A_Index%
			CurrentFields[A_Index] := RegExReplace(Value, "`n", "¤")
		}
 
		GameArray[CurrentGame ? CurrentGame : CurrentFields[2]] := CurrentFields.Clone()
 
		; To-do: save the file!
		NewContent := ""
		For Each, GameRecord In GameArray {
			Loop, %NumOfFields% {
				NewContent .= GameRecord[A_Index] . (A_Index = NumOfFields ? "`r`n" : Separator)
			}
		}
 
		if(HFILE := FileOpen(FileDir . "\" . FileName . ".csv", "w")) {
			HFILE.Write(NewContent)
			HFILE.Close()
 
		} else {
			MsgBox, 16, %GuiTitle%, Couldn't update file %FileName%.csv!`n`nError: %A_LastError%
		}
		PopulateFileLV()
		PopulateGameLV(FileName ".csv")
		CurrentGame := False
		NewContent := ""
	}
 
; Fall through to SubCancelBtn to do the rest
 
; Cancel button label --------------------------------------------------------------------------------------------------------------
SubCancelBtn:
	Editing := False
	GuiControl, Disable, CancelBtn
	GuiControl, Disable, SaveBtn
	Loop, %NumOfFields% {
		GuiControl, +ReadOnly, ED%A_Index%
	}
	GuiControl, Enable, EditBtn
	GuiControl, Enable, GameLV
	GuiControl, Enable, FileLV
	GuiControl, Focus, GameLV
	Gui, ListView, GameLV
	LV_Modify(LV_GetNext(), "Select") ; refill the game record fields
Return
 
; Edits label ----------------------------------------------------------------------------------------------------------------------
SubEditChanged:
	if(!Editing) { ; not in edit mode
		Return
	}
	if(!Modified) { ; first call while editing
		GuiControl, Enable, SaveBtn
	}
	Modified := True ; something in some of the edit control has been changed
Return
 
; ----------------------------------------------------------------------------------------------------------------------------------
CtlColorStatic(W, L) { ; changes the background of ReadOnly and disabled edits to white for better readability
	Static Init := OnMessage(0x0138, "CtlColorStatic") ; WM_CTLCOLORSTATIC = 0x0138
	Static DCBrush := DllCall("GetStockObject", "UInt", 18, "UPtr") ; DC_BRUSH = 18
	GuiControlGet, ControlName, Name, %L%
	If (SubStr(ControlName, 1, 2) = "ED") {
		DllCall("SetDCBrushColor", "Ptr", W, "UInt", 0xFFFFFF)
		Return DCBrush
	}
}
 
KillIE(){
	Global WB
	WB.Quit()
}
