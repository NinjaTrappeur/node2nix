{pkgs ? import <nixpkgs> {
  inherit system;
}, system ? builtins.currentSystem}:

let
  nodePackages = import ./default-v12.nix {
    inherit pkgs system;
  };
in
nodePackages // {
  floomatic = nodePackages.floomatic.override {
    buildInputs = [ pkgs.pkgconfig pkgs.qt4 ];
  };
}
