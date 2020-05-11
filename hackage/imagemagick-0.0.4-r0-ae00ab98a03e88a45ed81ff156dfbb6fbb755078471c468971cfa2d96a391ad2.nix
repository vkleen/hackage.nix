let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = { buildexamples = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "imagemagick"; version = "0.0.4"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "alexander.vershilov@gmail.com";
      author = "Alexander Vershilov, Kirill Zaborsky";
      homepage = "";
      url = "";
      synopsis = "bindings to imagemagick library";
      description = "Basic image magick bindings.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."MonadCatchIO-transformers" or (buildDepError "MonadCatchIO-transformers"))
          ];
        pkgconfig = [
          (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
          (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.hsc2hs or (pkgs.buildPackages.hsc2hs or (buildToolDepError "hsc2hs")))
          ];
        buildable = true;
        };
      exes = {
        "resize" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "extent" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "floodfill" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "cyclops" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "clipmask" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "paint-trans" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "round-mask" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "make-tile" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "draw-shapes" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "text-effects" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "gel" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "reflect" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "3dlogo" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "affine" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "grayscale" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "modulate" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = false;
          };
        "landscape3d" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "tilt-shift" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "bunny" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "pixel-mod" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        "wandtest" = {
          depends = (pkgs.lib).optionals (flags.buildexamples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = if flags.buildexamples then true else false;
          };
        };
      tests = {
        "image-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."imagemagick" or (buildDepError "imagemagick"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            ];
          pkgconfig = [
            (pkgconfPkgs."ImageMagick" or (pkgConfDepError "ImageMagick"))
            (pkgconfPkgs."MagickWand" or (pkgConfDepError "MagickWand"))
            ];
          buildable = true;
          };
        };
      };
    }