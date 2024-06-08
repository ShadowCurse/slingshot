{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  shellHook = ''
    export INCLUDE_GL="${pkgs.lib.makeIncludePath [
      pkgs.libGL
    ]}"
  '';
  buildInputs = with pkgs; [
    pkg-config

    wayland

    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xorg.libXinerama

    libxkbcommon
    libGL

    zip
    emscripten
    renderdoc
  ];
}
