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

  @load: (url, callback) ->
    createImage = (vol) ->
      dims = vol.header.imageDimensions
      data = ndarray(vol.imageData.data, [dims.xDim, dims.yDim, dims.zDim])

      # Add header fields
      header = {}
      header[k] = vol.header.fileFormat.nifti[k] for k in Object.keys(vol.header.fileFormat.nifti)

      #alert(img.header.qoffset_z)
      callback(new Image(data, header, 'volume', filetype='Nifti Volume'))
    
    vol = new papaya.volume.Volume()
    vol.readURL(url, createImage)
    

    
