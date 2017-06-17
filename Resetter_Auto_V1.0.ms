--Resetter
initialArray=selection as array
for i = 1 to initialArray.count do
(
	TempA=snapshot InitialArray[i]
	TempB=snapshot InitialArray[i]
	TempA.name="ToStay"+(formattedPrint i format:".4d")
	TempB.name="ToGo"+(formattedPrint i format:".4d")
	TempB.pos=[0,0,0]
)

select $ToGo*

exportFile (GetDir #scene + "/exportTest" ) selectedOnly:true using:ObjExp
delete $ToGo*
importFile (GetDir #scene + "/exportTest.obj" ) #noPrompt using:Wavefront_Object 
--Relocate
(
ToStay=$ToStay*
ToGo=$ToGo*

for i = 1 to ToGo.count do
(
	ToGo[i].pos=ToStay[i].pos
)
)


delete ToStay



