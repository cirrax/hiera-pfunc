# split a string into an Array
# @summary split a string into an array
#
# @param v
#   the string we like to split
# @param str
#   the string we use to split on (default ',')
function pfunc::split(String $v,String $str = ',') >> Array {
  $v.split($str)
}
