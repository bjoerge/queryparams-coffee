isArray = (obj) -> toString.call(obj) == '[object Array]';

append_key = (root_key, key) ->
  if root_key then "#{root_key}[#{key}]" else key

QueryParams = {}
QueryParams.encode = (val, key) ->
    if isArray(val)
      (QueryParams.encode(v, "#{key}[]") for v in val).join("&")
    else if typeof val == 'object'
      (QueryParams.encode(v, append_key(key, k)) for own k, v of val).join("&")
    else if val == undefined
      ""
    else
      "#{key}=#{encodeURIComponent(val)}"

exports.QueryParams = QueryParams