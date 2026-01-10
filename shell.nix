{ pkgs ? import <nixpkgs> {} }:


pkgs.mkShellNoCC {
    name="pyBucketGames-Shell";
    
    packages = with pkgs; [
       git uv python313 
       nodejs dart-sass
    ];
    
    BASE_PATH = builtins.getEnv "PWD";
    
    shellHook = ''
        alias updatecss="npm i && echo;echo;echo;echo 'To update minified css, please run \"npx purgecss --css $BASE_PATH/src/pybucketgames/_static/bootstrap.min.css --content $BASE_PATH/src/pybucketgames/templates/*.html $BASE_PATH/*/bucket.html $BASE_PATH/*/game.html $BASE_PATH/*/*/bucket.html $BASE_PATH/*/*/game.html $BASE_PATH/*/_website/**/*.html $BASE_PATH/*/_website/*.html --output $BASE_PATH/src/pybucketgames/_static/purgecss/\"'"
        alias pybucketgames="uv run pybucketgames";
        echo "Commands: pybucketgames, updatecss, git, uv";
    '';
}
