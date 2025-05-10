#
# @since 5.0.0
#
Puppet::Functions.create_function(:pfunc_lookup) do

  dispatch :pfunc_lookup do
    param 'Variant[String, Numeric]', :key
    param 'Hash', :options
    param 'Puppet::LookupContext', :context
  end

  def pfunc_lookup(key, options, context)
    # we only can handle lookups in specified format. so return
    # imediatly if it does not fit '.*||.*' 
    unless key.match?(/\|\|/)
      context.not_found
      return
    end

    # use cache:
    return context.cached_value(key) if context.cache_has_key(key)
 
    param, func = key.split('||')
    
    # pandoras box: call puppet from hiera !!!!!!!
    result =  call_function(func, *lookup_in_hiera(options, context, param))

    # put into cache and return
    context.cache(key, result)
  end

  def lookup_in_hiera(options, context, lkup)
    # lookup the parameter in hiera
    lookedup = context.interpolate("%{alias('#{lkup}')}")
    if lookedup.to_s.empty?
      raise ArgumentError, "pfunc_lookup hiera backend: could not lookup a value for #{lkup} in hiera"
    end
    lookedup
  end
end
