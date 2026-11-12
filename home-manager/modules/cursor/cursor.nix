{ pkgs, ... }:
let
  "Miku_Cursors" = pkgs.runCommand "moveUp" { } ''
    mkdir -p $out/share/icons
    ln -s ${
      pkgs.fetchzip {
        url = "https://github.com/supermariofps/hatsune-miku-windows-linux-cursors/releases/download/1.2.6/miku-cursor-linux.tar.xz";
        hash = "sha256-qxWhzTDzjMxK7NWzpMV9EMuF5rg9gnO8AZlc1J8CRjY=";
      }
    } $out/share/icons/Miku_Cursors
  '';
in
{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Miku_Cursors";
    size = 36;
    package = Miku_Cursors;
  };
}
