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
    flags = {
      builddemo = false;
      buildrasterdemo = false;
      buildvplaydemo = false;
      buildtranscodedemo = false;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "ffmpeg-light"; version = "0.12.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2018 Anthony Cowley";
      maintainer = "acowley@gmail.com";
      author = "Anthony Cowley";
      homepage = "http://github.com/acowley/ffmpeg-light";
      url = "";
      synopsis = "Minimal bindings to the FFmpeg library.";
      description = "Stream frames from an encoded video, or stream frames to\na video output file. To read the first frame from\nan @h264@-encoded file into a JuicyPixels\n@Maybe DynamicImage@,\n\n> import Codec.FFmpeg\n> import Codec.Picture\n> import Control.Applicative\n>\n> go :: IO (Maybe DynamicImage)\n> go = do (getFrame, cleanup) <- imageReader \"myVideo.mov\"\n>         (fmap ImageRGB8 <\$> getFrame) <* cleanup\n\nTested with FFmpeg 3.1 - 3.4.2";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."JuicyPixels" or (buildDepError "JuicyPixels"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        pkgconfig = [
          (pkgconfPkgs."libavutil" or (pkgConfDepError "libavutil"))
          (pkgconfPkgs."libavformat" or (pkgConfDepError "libavformat"))
          (pkgconfPkgs."libavcodec" or (pkgConfDepError "libavcodec"))
          (pkgconfPkgs."libswscale" or (pkgConfDepError "libswscale"))
          (pkgconfPkgs."libavdevice" or (pkgConfDepError "libavdevice"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.hsc2hs or (pkgs.buildPackages.hsc2hs or (buildToolDepError "hsc2hs")))
          ];
        buildable = true;
        };
      exes = {
        "demo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."JuicyPixels" or (buildDepError "JuicyPixels"))
            ] ++ (pkgs.lib).optionals (flags.builddemo) [
            (hsPkgs."ffmpeg-light" or (buildDepError "ffmpeg-light"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = if !flags.builddemo then false else true;
          };
        "raster" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."JuicyPixels" or (buildDepError "JuicyPixels"))
            ] ++ (pkgs.lib).optionals (flags.buildrasterdemo) [
            (hsPkgs."ffmpeg-light" or (buildDepError "ffmpeg-light"))
            (hsPkgs."Rasterific" or (buildDepError "Rasterific"))
            ];
          buildable = if !flags.buildrasterdemo then false else true;
          };
        "vplay" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ] ++ (pkgs.lib).optionals (flags.buildvplaydemo) [
            (hsPkgs."ffmpeg-light" or (buildDepError "ffmpeg-light"))
            (hsPkgs."sdl2" or (buildDepError "sdl2"))
            ];
          buildable = if !flags.buildvplaydemo then false else true;
          };
        "transcode" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."JuicyPixels" or (buildDepError "JuicyPixels"))
            ] ++ (pkgs.lib).optional (flags.buildtranscodedemo) (hsPkgs."ffmpeg-light" or (buildDepError "ffmpeg-light"));
          buildable = if !flags.buildtranscodedemo then false else true;
          };
        };
      };
    }