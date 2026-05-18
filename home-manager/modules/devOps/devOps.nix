{ pkgs, ... }:
{
  programs = {
    k9s = {
      enable = true;
      settings = {
        k9s = {
          noExitOnCtrlC = true;
        };
      };
    };
    kubecolor = {
      enable = true;
      enableAlias = true;
    };
    awscli = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    google-cloud-sdk
    # kdash
    kubectl
    terraform
  ];
}
