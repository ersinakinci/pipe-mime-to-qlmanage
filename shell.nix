{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  nodeEnv = callPackage ./node-env.nix {};
  nodePackages = callPackage ./node-packages.nix {
    globalBuildInputs = [
      nodejs
    ];
    inherit nodeEnv;
  };
in nodePackages.shell
