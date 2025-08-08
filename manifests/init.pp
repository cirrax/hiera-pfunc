# 
# class for testing...
# @summary this class is only for testing no need to include it anywhere
#
# @param nope
# @param split
# @param join
# @param hex
# 
class pfunc (
  Any  $nope,
  Array $split,
  String $join,
  String $hex,
) {
  notify { "pfunc::nope function result: |${nope}|": }
  notify { "pfunc::split function result: |${split}|": }
  notify { "pfunc::join function result: |${join}|": }
  notify { "pfunc::hex function result: |${hex}|": }
}
