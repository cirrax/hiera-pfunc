# do nothing, return parameter as is
# @summary just do nothing
# 
# @param v
#   just any parameter
# @return the parameter you have set
#
function pfunc::nope(Any $v) >> Any {
  # do nothing just return what we get
  $v
}
