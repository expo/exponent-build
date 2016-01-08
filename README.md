## Deployment instructions

#### `exponent-host`

The deploy process uses `master` at `git@github.com:exponentjs/exponent-host-internal.git` so make sure to push the version of the website you want to deploy there (TODO: add argument(s) to `build.sh` to specify branch/commit). Then just run `gulp deploy` from the root directory of your `exponent-host-internal` checkout.
