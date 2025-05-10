# format a integer as hex
function pfunc::hex(Integer $v) >> String {
  sprintf("0x%X", $v)
}

