(function() {
  var QueryParams, append_key, isArray,
    __hasProp = Object.prototype.hasOwnProperty;

  isArray = function(obj) {
    return Object.prototype.toString.call(obj) === '[object Array]';
  };

  append_key = function(root_key, key) {
    if (root_key) {
      return "" + root_key + "[" + key + "]";
    } else {
      return key;
    }
  };

  QueryParams = {};

  QueryParams.encode = function(val, key) {
    var k, v;
    if (isArray(val)) {
      return ((function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = val.length; _i < _len; _i++) {
          v = val[_i];
          _results.push(QueryParams.encode(v, "" + key + "[]"));
        }
        return _results;
      })()).join("&");
    } else if (typeof val === 'object') {
      return ((function() {
        var _results;
        _results = [];
        for (k in val) {
          if (!__hasProp.call(val, k)) continue;
          v = val[k];
          _results.push(QueryParams.encode(v, append_key(key, k)));
        }
        return _results;
      })()).join("&");
    } else if (val === void 0) {
      return "";
    } else {
      return "" + key + "=" + (encodeURIComponent(val));
    }
  };

  exports.QueryParams = QueryParams;

}).call(this);
