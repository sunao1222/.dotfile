{ inputs, ... }:
{

  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
    };
      elephant = {
        settings = {
        providers = {
          desktopapplications = {
            launch_prefix = "uwsm-app";
          };
        };
      };
    };
  };
}
