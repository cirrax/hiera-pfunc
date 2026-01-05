# hiera-pfunc hiera backend

This is a hiera backend to call puppet functions from hiera.

## Usage

1. Add the module to the puppet code (like any other module)
2. add the following hierarchy into hiera.yaml
   ```
   hierarchy:
     - name: 'pfunc run puppet function as hiera lookups'
       lookup_key: pfunc_lookup
   ```
3. to actually call a puppet function from hiera use:
   ```
   # do nothing function
   pfunc::testparams::nope: 'test for doing nothing'
   pfunc::nope: "%{lookup('pfunc::testparams::nope||pfunc::nope')}"
   #                        ^                        ^
   #                        |                        L fully qualified puppet function
   #                        L parameters to lookup
   ```


* see common.yaml in data directory for additional examples
* use ```alias``` instead of ```lookup``` for puppet functions with a non String return value
* for a demo you can use ```include pfunc``` which will execute certain functions (from common.yaml) and notify the result
* I advice using this backend with a high priority to avid overwrite function results in the hierarchy
* lookup_options specifying merge behaviours are supported.

## Limitations
This hiera backend uses caching of function results. So functions that are non deterministic (such as generating a random string) will not work as expected.

## Contributing

Please report bugs and feature request using GitHub issue tracker.

For pull requests, it is very much appreciated to check your Puppet manifest with puppet-lint
and the available spec tests  in order to follow the recommended Puppet style guidelines
from the Puppet Labs style guide.

### Authors

This module is mainly written by [Cirrax GmbH](https://cirrax.com).

for a list of all contributors.See the [list of contributors](https://github.com/cirrax/hiera-pfunc/graphs/contributors)
