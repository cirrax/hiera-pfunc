# 
# class for testing...
# 
class pfunc (
  Any  $nope   = 'default',
  Array $split  = ['default'],
  String $join = 'default',
  String $hex = 'default',
) {

  notify{"pfunc::nope function result: |${nope}|": }
  notify{"pfunc::split function result: |${split}|": }
  notify{"pfunc::join function result: |${join}|": }
  notify{"pfunc::hex function result: |${hex}|": }
}

