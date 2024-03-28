{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  shellHook = ''
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [
    pkgs.raylib
  ]}"
  '';
  buildInputs = with pkgs; [
    raylib
    pkg-config
  ];
}
