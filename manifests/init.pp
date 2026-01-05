# 
# class for testing...
# @summary this class is only for testing no need to include it anywhere
#
# @param nope
#   result of the pfunc::nope function to print out
#   see data/common.yaml for the function call
# @param split
#   result of the pfunc::split function to print out
#   see data/common.yaml for the function call
# @param join
#   result of the pfunc::join function to print out
#   see data/common.yaml for the function call
# @param hex
#   result of the pfunc::hex function to print out
#   see data/common.yaml for the function call
# 
class pfunc (
  Any  $nope,
  Array $split,
  String $join,
  String $hex,
) {
  notify { 'pfunc::nope function result':
    message => "pfunc::nope function result: |${nope}|",
  }
  notify { 'pfunc::split function result':
    message => "pfunc::split function result: |${split}|",
  }
  notify { 'pfunc::join function result':
    message => "pfunc::join function result: |${join}|",
  }
  notify { 'pfunc::hex function result':
    message => "pfunc::hex function result: |${hex}|",
  }
}
