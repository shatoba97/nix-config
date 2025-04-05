{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.programs.uwsm = {
    enable = false;
  };
}
