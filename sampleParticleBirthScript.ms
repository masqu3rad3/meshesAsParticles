--This is a sample script to attach meshes to particles
--By default, collects all objects starts  with "ToGo" and us theri shapes and positions to create particles.
--Resetter script may need to be run before to reset the world space positions. (somehow freezing is nor working)

on ChannelsUsed pCont do
(
     pcont.usePosition = true
     pcont.useShape = true
)

on Init pCont do
(
 global groundGeom = $ToGo* as array
)

on Proceed pCont do
(
    t1 = pCont.getTimeStart() as float
    t2 = pCont.getTimeEnd() as float

    if ((t1 <= 0) and (t2 >=0)) then
    (
        (
        pcont.addparticles groundgeom.count
        for i in 1 to groundgeom.count do
            (
            pcont.particleindex = i
            pcont.particleshape = groundgeom[i].mesh
            pcont.particleposition = groundgeom[i].position
            )
        )
    )

)

on Release pCont do
(
 
)