
describe "Image", ->

  it "initializes successfully", ->
    image = new Image([1, 2, 3], {slice_duration: 12}, 'volume')
    expect(image).toBeDefined()
    expect(image.header).toBeDefined()
    expect(image.description).toBe('')

  it "loads from a URL", (done) ->
    # Test will fail for now because loading is asynchronous and test 
    # doesn't wait for result to return. Need to update test with waitFor()
    Image.load('data/brain.nii.gz', (image) ->
      expect(image).toBeDefined()
      done()
    )
    

  it "returns the header", ->
    image = new Image([1, 2, 3], 'I am a header!', 'volume')
    expect(image.getHeader()).toBe('I am a header!')

  it "returns the data", ->
    image = new Image('I am some data!', 14, 'volume')
    expect(image.getData(false)).toBe('I am some data!')