from paraview.simple import *

activeSource = GetActiveSource()
calculator1 = Calculator(Input=activeSource)

calculator1.ResultArrayName = 'von_mises'
calculator1.Function = ' sqrt(0.5*( (Stress_XX-Stress_YY)^2 + (Stress_YY - Stress_ZZ)^2 + (Stress_ZZ - Stress_XX)^2 ) + 3*(Stress_XY*Stress_XY + Stress_YZ*Stress_YZ + Stress_XZ*Stress_XZ))'

renderView1 = GetActiveViewOrCreate('RenderView')

LUT = GetColorTransferFunction('von_mises')
LUT.ApplyPreset('Rainbow Desaturated', True)
LUT.NumberOfTableValues = 32

Hide(activeSource,renderView1)
threshold4Display = Show(calculator1, renderView1)
