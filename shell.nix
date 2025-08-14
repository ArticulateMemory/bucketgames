{ pkgs ? import <nixpkgs> {} }:


pkgs.mkShellNoCC {
    packages = with pkgs; [
       git uv python313
    ];

#     shellHook = ''
#         echo "Available commands: git, uv"
#     '';
}
