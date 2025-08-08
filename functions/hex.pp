# format a integer as hex
# @summary format an integer as a hex string
# @param v
#   an integer
# @return hex interpretation of input
#
function pfunc::hex(Integer $v) >> String {
  sprintf('0x%X', $v)
}
