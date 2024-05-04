{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  shellHook = ''
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [
    pkgs.libxkbcommon
  ]}"
  '';
  buildInputs = with pkgs; [
    libGL
    wayland
    emscripten
    libxkbcommon
    pkg-config
  ];
}
