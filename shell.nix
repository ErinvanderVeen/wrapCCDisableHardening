with import <nixpkgs> {};
let
  my-cc =
    wrapCCWith {
      cc = stdenv.cc.overrideAttrs (oldAttrs: {
        hardeningUnsupportedFlags =
          ["fortify"] ++ oldAttrs.hardeningUnsupportedFlags or [];
      });
    };

  my-stdenv = overrideCC stdenv my-cc;
in
  my-stdenv.mkDerivation {
    name = "test-env";
    buildInputs = [ ];
  }
