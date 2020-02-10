from paraview.simple import *

activeSource = GetActiveSource()
displacementLUT = GetColorTransferFunction('Displacement')
stressLUT = GetColorTransferFunction('Stress')

stressLUT.ApplyPreset('Rainbow Desaturated', True)
stressLUT.NumberOfTableValues = 32

displacementLUT.ApplyPreset('Rainbow Desaturated', True)
displacementLUT.NumberOfTableValues = 32
