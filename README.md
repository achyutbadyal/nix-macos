# Home Manager configuration

This flake manages the `achyutbadyal` Home Manager profile on Apple Silicon
macOS. Custom packages are defined in `pkgs/`, and their upstream versions and
source hashes are managed by [nvfetcher](https://github.com/berberman/nvfetcher).

## Commands

```sh
mise run sources  # update custom package versions and hashes
mise run check    # evaluate the flake without building it
mise run build    # build the Home Manager generation
mise run switch   # build and activate the generation
```
