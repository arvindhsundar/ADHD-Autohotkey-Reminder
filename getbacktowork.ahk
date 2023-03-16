GetBackToWork() ;automatically calls this function when the script is loaded. you gotta configure your ahk for it
SetTimer(GetBackToWork, 120000) ;runs this every 2 minutes

GetBackToWork(*)
{

Text := FileRead("C:\Users\GreenGlade\Typhoon\Notes\To Do.md") ;replace the path with whatever is the path to your todo list. It should have one item per list and the task you're supposed to be working on should have 'NOW' as prefix

Loop parse, Text, "`n", "`r"  ;Looping through the file, breaking at end of line
{
    	if InStr(A_LoopField, "NOW") ;searching for NOW. NOW is the task you're (supposed to be) working on right now
		{
			MyGui := Gui()
			MyGui.Opt("+AlwaysOnTop -caption  -SysMenu +Owner")
			MyGui.BackColor := "90D400" ;Setting this as my favourite green colour
			MyGui.SetFont(, "Roboto Mono") ;Setting this as my favourite font
			MyGui.SetFont("cblack s16 bold") ;Setting attributes of the font
			MyGui.Add("Text",, Substr(A_LoopField,4)) ;Adding the line (without the 'NOW ' to the green bar
			Loop 6{ ;looping it 6 times so that it flashes
				MyGui.Show("xCenter y950 NoActivate") 
				Sleep 2000
				MyGui.Hide()
				Sleep 500
			}
			MyGui.Destroy() ;i had to do this else the text wouldn't update ¯\_(•_•)_/¯
		}
}
}
