# calculate md5 sum of a string
# 
# @summary calculate the md5 sum of a string
#
# @param v
#   a string
# @return the md5sum of the string
#
function pfunc::md5(String $v) >> String {
  md5($v)
}
