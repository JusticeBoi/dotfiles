from paraview.simple import *

activeSource = GetActiveSource()
warpByVector = WarpByVector(Input=activeSource)
warpByVector.Vectors = ['POINTS','Displacement']

renderView1 = GetActiveViewOrCreate('RenderView')

Hide(activeSource,renderView1)

warpByVectorDisplay = Show(warpByVector, renderView1)
