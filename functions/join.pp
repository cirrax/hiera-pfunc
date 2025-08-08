# join an Array
# @summary join values of an array into a string
# @param v
#   the array to concatenate
# @param str
#   string to use inbetween the elements
#   defaults to ','
# @return the joined array
# 
function pfunc::join(Array $v, String $str=',') >> String {
  $v.join($str)
}
