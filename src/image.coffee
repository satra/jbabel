class @Image

  constructor: (@data, @header, @dtype, {@filetype, @name, @description, @metadata} = {}) ->

    @filetype ?= ''
    @dtype = 'volume'
    @name  ?= ''
    @description ?= ''
    @metadata ?= {}

  getData: (remap=true) -> 
    if remap then @remapData() else @data

  remapData: () ->
    # Apply the current affine transform and return the result

  getHeader: () -> 
    @header

  @fromPapayaVolume: (volume) ->
    # Initialize an Image class from a Papaya volume. Doesn't work yet
    [a for a in b if a == 3]
    data = volume.data
    dtype = 'volume'
    filetype = 'Nifti Volume'

    # Add header fields
    header = {}
    header[k] = volume.nifti.NIFTI[k] for k in volume.nifti.NIFTI.keys()

    new Image(data, header, dtype, filetype=filetype)
