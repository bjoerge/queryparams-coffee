should = require('should')

QueryParams = require('../src/queryparams').QueryParams

describe 'QueryParams', -> 
  it "generates nothing if need be", ->
    QueryParams.encode({}).should.equal ""
    QueryParams.encode(null).should.equal ""

  it "generates a straight forward query string", ->
    QueryParams.encode({a: 1, b: "c"}).should.equal "a=1&b=c"

  it "handles nested hashes", ->
    QueryParams.encode({a: {b: 'c', d: 'e'}, f: 'g'}).should.equal "a[b]=c&a[d]=e&f=g"

  it "handles arrays", ->
    QueryParams.encode({a: ['bingo', 'hepp']}).should.equal "a[]=bingo&a[]=hepp"

  it "handles arrays of hashes", ->
    QueryParams.encode({a: [{b:'c', d:'e'}, {b:'g'}]}).should.equal "a[][b]=c&a[][d]=e&a[][b]=g"
