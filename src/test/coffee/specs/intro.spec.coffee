describe "A suite", ->
  it "contains spec with an expectation", ->
    expect(true).toBe true

describe "A suite is just a function", ->
  a = undefined
  it "and so is a spec", ->
    a = true
    expect(a).toBe true

describe "The 'toBe' matcher compares with ===", ->
  it "and has a positive case ", ->
    expect(true).toBe true

  it "and can have a negative case", ->
    expect(false).not.toBe true

describe "Included matchers:", ->
  it "The 'toBe' matcher compares with ===", ->
    a = 12
    b = a
    expect(a).toBe b
    expect(a).not.toBe null

  describe "The 'toEqual' matcher", ->
    it "works for simple literals and variables", ->
      a = 12
      expect(a).toEqual 12

    it "should work for objects", ->
      foo =
        a: 12
        b: 34

      bar =
        a: 12
        b: 34

      expect(foo).toEqual bar


  it "The 'toMatch' matcher is for regular expressions", ->
    message = "foo bar baz"
    expect(message).toMatch /bar/
    expect(message).toMatch "bar"
    expect(message).not.toMatch /quux/

  it "The 'toBeDefined' matcher compares against `undefined`", ->
    a = foo: "foo"
    expect(a.foo).toBeDefined()
    expect(a.bar).not.toBeDefined()

  it "The `toBeUndefined` matcher compares against `undefined`", ->
    a = foo: "foo"
    expect(a.foo).not.toBeUndefined()
    expect(a.bar).toBeUndefined()

  it "The 'toBeNull' matcher compares against null", ->
    a = null
    foo = "foo"
    expect(null).toBeNull()
    expect(a).toBeNull()
    expect(foo).not.toBeNull()

  it "The 'toBeTruthy' matcher is for boolean casting testing", ->
    a = undefined
    foo = "foo"
    expect(foo).toBeTruthy()
    expect(a).not.toBeTruthy()

  it "The 'toBeFalsy' matcher is for boolean casting testing", ->
    a = undefined
    foo = "foo"
    expect(a).toBeFalsy()
    expect(foo).not.toBeFalsy()

  it "The 'toContain' matcher is for finding an item in an Array", ->
    a = ["foo", "bar", "baz"]
    expect(a).toContain "bar"
    expect(a).not.toContain "quux"

  it "The 'toBeLessThan' matcher is for mathematical comparisons", ->
    pi = 3.1415926
    e = 2.78
    expect(e).toBeLessThan pi
    expect(pi).not.toBeLessThan e

  it "The 'toBeGreaterThan' is for mathematical comparisons", ->
    pi = 3.1415926
    e = 2.78
    expect(pi).toBeGreaterThan e
    expect(e).not.toBeGreaterThan pi

  it "The 'toBeCloseTo' matcher is for precision math comparison", ->
    pi = 3.1415926
    e = 2.78
    expect(pi).not.toBeCloseTo e, 2
    expect(pi).toBeCloseTo e, 0

  it "The 'toThrow' matcher is for testing if a function throws an exception", ->
    foo = ->
      1 + 2

    bar = ->
      a + 1

    expect(foo).not.toThrow()
    expect(bar).toThrow()

describe "A spec", ->
  it "is just a function, so it can contain any code", ->
    foo = 0
    foo += 1
    expect(foo).toEqual 1

  it "can have more than one expectation", ->
    foo = 0
    foo += 1
    expect(foo).toEqual 1
    expect(true).toEqual true

