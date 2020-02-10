from paraview.simple import *

activeSource = GetActiveSource()
threshold3 = Threshold(Input=activeSource, Scalars=['MeshIndex'])

threshold3.ThresholdRange = [0, 0]
renderView1 = GetActiveViewOrCreate('RenderView')

Hide(activeSource,renderView1)

threshold4 = Threshold(Input=threshold3, Scalars=['DomainIndex'])

threshold4.ThresholdRange = [1, 1]
renderView1 = GetActiveViewOrCreate('RenderView')

threshold4Display = Show(threshold4, renderView1)
