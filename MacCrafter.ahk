#SingleInstance,Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Menu, Tray, Icon, mjc.ico

;----------------------------- DATA: ---------------------------------------
aspect = 1:1||3:2|16:9|9:16|21:9|4:3|3:4|3:1|6:4|4:6

versions = 2|3|4|| 

;----------------------------- CODE: ---------------------------------------

leftMargin = x40

btnWidth = w140

elWidth = w380
rShow = r16.8

colTwo = x450
rowTwo = y93

colThree = x860
rowThree = y93

colFour = x1270
rowFour = y5

rowOneY = y93
rowTwoY	= y480
rowThreeY = y580


Heart := % Chr(0x2764)

;----------------------------------------WINDOW SETUP ------------------------------------
appHeight := 1000    ;A_ScreenHeight-80
Gui, Show , w1450 h%appHeight%, MJ Promp MacCrafter with a side order of fries V1.0 by 735
Gui, Font, s12, Verdana



;---------------------------------------- MAIN PROMPT ------------------------------------
Gui, Add, Text, x40 y30 w150 h18, Main Prompt:
Gui, Add, Edit, w1200 vPrompt Left


Menu, ListRCMenu, Add, Show Image, showImage

; #################### COL 1 ###################################
;---------------------------------------- EFFECTS ------------------------------------
Gui, Add, Text, w90 h1,
Gui, Add, Text, w150 h18, Effects:
Gui, Add, ListView, x40 %rShow% %elWidth% AltSubmit Grid Multi vEffects gEffectsHandler, Name |%Heart%
LV_ModifyCol(1, 312)
LV_ModifyCol(2, "45 Center")
EffectsHandler() {
	SetFav("Effects")
}

;---------------------------------------- ARTISTS ------------------------------------
Gui, Add, Text, w90 h1,
Gui, Add, Text, w150 h18, Artists:
Gui, Add, ListView, x40 %rShow% %elWidth% Grid Multi vArtists gArtistsHandler, Name |%Heart%
LV_ModifyCol(1, 312)
LV_ModifyCol(2, "45 Center")
ArtistsHandler() {
	SetFav("Artists")
}

; #################### COL 2 ###################################
;---------------------------------------- STYLES ------------------------------------
Gui, Add, Text, %colTwo% %rowTwo% w90 h1,
Gui, Add, Text, w150 h18, Styles:
Gui, Add, ListView, %rShow% %elWidth% AltSubmit Grid Multi vStyles gStylesHandler, Name |%Heart%
LV_ModifyCol(1, 312)
LV_ModifyCol(2, "45 Center")
StylesHandler() {
	SetFav("Styles")
}

;---------------------------------------- ART EXAMPLE IMAGE -----------------------------
Gui, Add, Text, w90 h1,
Gui, Add, Text, w150 h18 vImageTxt, Sample:
Gui, Add, Picture, vImg %elWidth% h-1, images/0.png



; #################### COL 3 ###################################
;---------------------------------------- RENDERINGS ------------------------------------
Gui, Add, Text, %colThree% %rowThree% w90 h1,
Gui, Add, Text, w150 h18, Renderings:
Gui, Add, ListView, %rShow% %elWidth% AltSubmit Grid Multi vRenderings gRenderingsHandler, Name |%Heart%
LV_ModifyCol(1, 312)
LV_ModifyCol(2, "45 Center")
RenderingsHandler() {
	SetFav("Renderings")
}

;---------------------------------------- PROMPT IMAGE URL -----------------------------
Gui, Add, Text, w90 h1,
Gui, Add, Text, w150 h18, Img URL:
Gui, Add, Picture, vImgLnk %elWidth% h380, images/2.png

Gui, Add, Edit, x940 y540 w300  vImgPrompt Left




; ################### COL 4 ###################################
Gui, Add, Text, %colFour% %rowFour% w120 h40,
Gui, Add, Button, %btnWidth% h32 vImagineBtn gImagineIt , /imagine


;---------------------------------------- IMAGE WEIGHTS ------------------------------------
Gui, Add, Text, %colFour% y123 w190 h18, IMG WTS (0-?):
Gui, Add, Edit, %btnWidth% vImgWeightChoice Left

;---------------------------------------- Chaos ------------------------------------
Gui, Add, Text, w190 h18, Chaos (0-100):
Gui, Add, Edit, %btnWidth% vChaosChoice Left, 

;---------------------------------------- Target Window ------------------------------------
Gui, Add, Text, w190 h18, Target Window:
Gui, Add, Edit, -Wrap %btnWidth% h28 vTargetChoice, @Midjourney Bot - Discord

;---------------------------------------- ASPECT RATIOS ------------------------------------
Gui, Add, Text, w120 h18, Aspect Ratio:
Gui, Add, DDL, %btnWidth% vAspectChoice, %aspect%

;---------------------------------------- VERSIONS ------------------------------------
;Gui, Add, Text, %btnWidth% h10,
Gui, Add, Text, w120 h18, Versions:
Gui, Add, DDL, %btnWidth% vVersionChoice, %versions%


;---------------------------------------- Misc ------------------------------------
Gui, Add, Text, w190 h18, Custom Flags:
Gui, Add, Edit, %btnWidth% vCustomChoice Left, 

;---------------------------------------- TOOLS ------------------------------------

Gui, Add, Button, %btnWidth% h32 vSettingsBtn gOpenSettings , MJ Settings

Gui, Add, Button, %btnWidth% h32 vShowBtn gShowJob , /Show

Gui, Add, Button, %btnWidth% h32 vHelpBtn gOpenHelp , Help

Gui, Add, Text, w250, ______________
;Gui, Add, Text, %btnWidth% h14,
Gui, Add, Button,%btnWidth% h32 vGetUrlImg gShowUrlImage, <= Get Img

Gui, Add, Button,%btnWidth% h32 vClrUrlImg gClearUrlImage, Clear Img


Gui, Add, Text, w250, ______________
;Gui, Add, Text, %btnWidth% h14,
Gui, Add, CheckBox, vVideoOut, Video Out


Gui, Add, Button, x360 y109 w60 h20 vClear_Effects gClearList , Clear
Gui, Add, Button, x770 y109 w60 h20 vClear_Styles gClearList , Clear
Gui, Add, Button, x1180 y109 w60 h20 vClear_Renderings gClearList , Clear

Gui, Add, Button, x360 y543 w60 h20 vClear_Artists gClearList , Clear




/*
Gui, Add, Button,%btnWidth% h32 vUploadImg gUploadImage, Upload Img
I added this before remembering you can't send an image, it has to be a url.
*/


; add the ui elements without a return, then load data
OpenData()
; now put a return so the app stays open
return


/*

Need to move Renderers  Aspect Ratio data to the data file for ease of maintaining


*/

;---------------------------------------- GENERAL FUNCTIONS -----------------------------


ClearList:
	splitName := StrSplit(A_GuiControl, "_")
	whichList := splitName[2]
	GUI, ListView, %whichList%
	LV_Modify(0, "-Select")
return

ClearUrlImage:
	GuiControl,,ImgLnk, images/2.png
	GuiControl,, ImgPrompt, 
return


GuiContextMenu:
    if (A_GuiControl == "Artists" or A_GuiControl == "Styles" or A_GuiControl == "Renderings" or A_GuiControl == "Effects") {
		if (A_EventInfo) {
			rightClickedRow := A_EventInfo
			listViewClicked := A_GuiControl
			Menu, ListRCMenu, Show
		}
	}
return

showImage:
    catName := ""
    GUI, ListView, %listViewClicked%
    LV_GetText(Name, rightClickedRow, 1) ; Get the text from column 1 of the list view
	catName := "images/"StrReplace(Name, " ", "_")".jpg"
	oFile := FileOpen(catName, "r-d") 
	found := "found"
	if (!IsObject(oFile)) {
		found := "notfound"
	} 
	if (found == "notfound") {
		found := "found"
		catName := "images/"StrReplace(Name, " ", "_")".png"
		oFile := FileOpen(catName, "r-d") 
	}
	if (!IsObject(oFile)) {
		found := "notfound"
	} 


	if (found == "notfound") {
		GuiControl,,ImageTxt, Not Found
	    GuiControl,,Img, images/0.png	
	} else {
		GuiControl,,ImageTxt, %Name%
	    GuiControl,,Img, %catName%
	}
return

ShowUrlImage:
	ControlGetText, ImageToGet, Edit2
	StringRight, imgType, ImageToGet, 3
	if (imgType == "jpg" or imgType == "png") {
		UrlDownloadToFile,%ImageToGet%,tmp\urlImage1.%imgType%
		;sleep, 1000
		GuiControl,,ImgLnk, tmp/urlImage1.%imgType%		
	} else {
		MsgBox, Image type incompatible: %imgType%
	}
return

UploadImage:
	/*
		Currently not used as you need a URL to feed MJ
		Keeping it around in case something changes.
	*/
	FileSelectFile, SelectedFile, 3, , Open a file, Images (*.jpg; *.png)
	if (SelectedFile = "")
	    MsgBox, You didn't select anything.
	else
		GuiControl,,ImgLnk, %SelectedFile%
return


SetFav(lv)
{
	gui, Listview, %lv% 

    if A_GuiEvent = DoubleClick 
    {	
    	LV_GetText(Name, A_EventInfo, 1)
        LV_GetText(isFaved, A_EventInfo, 2) 
        if (isFaved == "X") {
        	LV_Modify(A_EventInfo, "", Name, "")
        	SaveData()
        } else {
        	LV_Modify(A_EventInfo, "", Name, "X")
        	SaveData()
        }
    } 

}

OpenHelp()
{
	MsgBox, Type your main idea in the top prompt. i. e. A giant walrus on stilts chasing little children.`n`nMake selections from the various fields.`n`nHold ctrl-click to make multiple selections in a list (only for lists, not dropdowns).`n`nIn Lists, double click to add/remove entries from favorites (Indicated with the X).`n`nWith each double click for favoriting, it saves to the MJData.txt file. To have all your favorites at the top next time you open, click the heart a couple times to get them at the top, then deselect/reselect one.`n`nHave Discord open and ready to receive as it types in the message box.`n`nRight click > Show Image to see an example, if one exists. Right click was chosen so you could check things even with several things multiselected without losing your selections (assuming the one you want to see is already selected, otherwise, make sure to hold ctrl). `n`nIf you have an old job you want to pull back up, get the job id (usually part of the image name), paste it into the prompt box, and hit /show`n`nThis defaults to use the Midjourey chat bot you can use when you pay for it. If you want to use it in another place, like the #daily-theme on the Midjourney server, hover over discord in the taskbar and type in what you see in the Target Win box. This overrides the default and will work with any window you can target using this method. Note that when you see something like #hashtag | Midjourney - Discord, that the pipe has a space on each side. If you want to change the default, you can do so in the script by changing anywhere it says @Midjourney Bot - Discord to whatever window you will be using from now on as a default.`n`nSometimes it will type in Discord, but the /imagine prompt doesn't pick it up. It usually happens after it hasn't been used in a while. Just hit the /imagine button and send it again and ignore the first one. `n`nData for the various lists are in the MJData.txt file (not dropdowns). Want to add/remove items? Do it there, but be careful to keep the format as you see it with NameOfFormElement,Name of thing,X, or no X, still needs the extra comma.`n`nCan put in an image prompt using a url.`n`nTry mixing it up, like more than one artist at a time, for example.`n`nCheck http://tesanders.com for contact.`n`nNo waranty or copyrights -- do what you will, and let the rest burn in your wake.
}


;--------------------------------------- SAVE DATA ----------------------------------
SaveData()
{
	FileName := "MJdata.txt"
	oFile := FileOpen(FileName, "w") ; Creates a new file, overwriting any existing file with session UI data
	if (!IsObject(oFile)) {       
		MsgBox Can't open "%FileName%" for reading.
	} else {
		for i, LV in ["Artists", "Effects", "Styles", "Renderings"] {
			Gui, ListView, %LV%
			Loop % LV_GetCount() {
				LV_GetText(oCol1, A_index, 1)
				LV_GetText(oCol2, A_index, 2)
				oLine := LV "," oCol1 "," oCol2 ","
				oFile.WriteLine(oLine)
			}
		 }
		oFile.Close() 
	}
}

;-------------------------------------- OPEN DATA --------------------------------------
OpenData()
{
	FileName := "MJdata.txt"
	oFile := FileOpen(FileName, "r-d") ; read the file ("r"), share all access except for delete ("-d")
	if (!IsObject(oFile)) { 
		  MsgBox Can't open "%FileName%" for reading.`nExiting.
			ExitApp
	} else {
	for i, LV in ["Artists", "Effects", "Styles", "Photographers", "Renderings"] {
		Gui, ListView, %LV%
		LV_Delete()
	}
	Loop {
		oLine := oFile.ReadLine()
		oCol := StrSplit(oLine , ",")
			Gui, ListView, % oCol[1]
			LV_Add("",oCol[2],oCol[3])
		}
		until oFile.AtEOF
		oFile.Close() 
	}
}




ShowJob:
	Gui, Submit, nohide

	target := "@Midjourney Bot - Discord"
	if(TargetChoice and TargetChoice != "") {
		target = %TargetChoice%
	}	

	WinActivate, %target%
	WinWaitActive, %target%
	Send, /show {Space}

	SendInput, %Prompt% 
	sleep, 500
	SendInput, {Enter}

return

;------------------------ /imagine
ImagineIt: 
	Gui, Submit, nohide
	MainPrompt = %ImgPrompt% %Prompt%

	Renderings := GetMultiSelect("Renderings")
	Effects := GetMultiSelect("Effects")
	Styles := GetMultiSelect("Styles") 
	Artists := GetMultiSelect("Artists")

	if(Effects and Effects != "") {
	  MainPrompt = %MainPrompt%, %Effects%
	}
	if(Styles and Styles != "") {
	  MainPrompt = %MainPrompt%, %Styles%
	}
	if(Renderings and Renderings != "") {
       MainPrompt = %MainPrompt%, %Renderings%  
	} 
	if(Artists and Artists != "") {
	  MainPrompt = %MainPrompt% by %Artists%
	}
	if(AspectChoice and AspectChoice != "") {
	  MainPrompt = %MainPrompt% --ar %AspectChoice%     
	}
	if(VersionChoice and VersionChoice != "") {
	  MainPrompt = %MainPrompt% --v %VersionChoice%     
	}
	if(ImgWeightChoice and ImgWeightChoice != "") {
	  MainPrompt = %MainPrompt% --iw %ImgWeightChoice%     
	}
	if(ChaosChoice and ChaosChoice != "") {
	  MainPrompt = %MainPrompt% --chaos %ChaosChoice%     
	}
	if(CustomChoice and CustomChoice != "") {
	  MainPrompt = %MainPrompt% %CustomChoice%     
	}
	if(VideoOut) {
	  MainPrompt = %MainPrompt% --video   
	  ;gotta use regular upscale > remaster to get full image video 
	}	

	target := "@Midjourney Bot - Discord"
	if(TargetChoice and TargetChoice != "") {
		target = %TargetChoice%
	}

	WinActivate, %target%
	WinWaitActive, %target%
	Send, /imagine {Space}

	SendInput, %MainPrompt% 
	sleep, 500
	SendInput, {Enter}
	
return



GetMultiSelect(WhichList)
{
	Gui, ListView, %WhichList%
	RowNumber = 0 
	Names =  
	Loop
	{
		RowNumber := LV_GetNext(RowNumber)  
		if not RowNumber 
			break
		LV_GetText(Name, RowNumber)
		if(Name != "")
			Names .= Name ", "
	}
	Return Names
}


;----------------------- /settings
OpenSettings:
	Gui, Submit, nohide
	WinActivate, @Midjourney Bot - Discord
	WinWaitActive, @Midjourney Bot - Discord
	Send, /settings {Enter}
return






GuiClose:
ExitApp







