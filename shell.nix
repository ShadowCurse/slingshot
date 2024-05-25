{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  shellHook = ''
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [
    pkgs.libxkbcommon
  ]}"
  export INCLUDE_GL="${pkgs.lib.makeIncludePath [
    pkgs.libGL
  ]}"
  '';
  buildInputs = with pkgs; [
    zip
    libGL
    wayland
    emscripten
    libxkbcommon
    pkg-config
  ];
}
