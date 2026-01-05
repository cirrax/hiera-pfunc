# frozen_string_literal: true

#
# @since 5.0.0
#
Puppet::Functions.create_function(:pfunc_lookup) do
  dispatch :pfunc_lookup do
    param 'Variant[String, Numeric]', :key
    param 'Hash', :options
    param 'Puppet::LookupContext', :context
  end

  #
  # hiera lookup function that calls a puppet function
  #
  # @param key
  #   the key to lookup, format must be:
  #     parameter||function
  #   while parameter is a Array of the parameters to use for
  #   calling the function. function is the fully qualified
  #   function name, like you use it in any manifest
  # @param options
  #   hash of options (unused)
  # @param context
  #   the lookup context
  # @return
  #   the result of the executed puppet function
  def pfunc_lookup(key, options, context)
    # we only can handle lookups in specified format. so return
    # imediatly if it does not fit '.*||.*'
    unless key.match?(%r{\|\|})
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

  def lookup_in_hiera(_options, context, lkup)
    # lookup the parameter in hiera
    lookedup = context.interpolate("%{alias('#{lkup}')}")
    raise ArgumentError, "pfunc_lookup hiera backend: could not lookup a value for #{lkup} in hiera" if lookedup.to_s.empty?

    lookedup
  end
end
