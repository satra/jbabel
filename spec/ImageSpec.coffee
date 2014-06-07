
describe "Image", ->

  it "initializes successfully", ->
    image = new Image([1, 2, 3], {slice_duration: 12}, 'volume')
    expect(image).toBeDefined()
    expect(image.header).toBeDefined()
    expect(image.description).toBe('')

  it "initializes successfully from a Papaya volume", ->
    papaya_vol = 1
    image = Image.fromPapayaVolume(volume)
    expect(image).toBeDefined()

  it "returns the header", ->
    image = new Image([1, 2, 3], 'I am a header!', 'volume')
    expect(image.getHeader()).toBe('I am a header!')

  it "returns the data", ->
    image = new Image('I am some data!', 14, 'volume')
    expect(image.getData(false)).toBe('I am some data!')