{ pkgs ? import <nixpkgs> {} }:


pkgs.mkShellNoCC {
    packages = with pkgs; [
       git uv python313
    ];

    shellHook = ''
        alias pybucketgames="uv run pybucketgames";
        
        echo "Available commands: pybucketgames, uv, git"
    '';
}
