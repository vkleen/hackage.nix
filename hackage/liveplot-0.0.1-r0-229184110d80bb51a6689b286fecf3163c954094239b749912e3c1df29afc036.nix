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
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "liveplot"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2017 Richard Marko";
      maintainer = "srk@48.io";
      author = "Richard Marko";
      homepage = "";
      url = "";
      synopsis = "Liveplotting";
      description = "Live plotting with OpenGL. This Haskell library allows feeding live data via Pipes to OpenGL plots.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."andromeda" or (buildDepError "andromeda"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."GLFW-b" or (buildDepError "GLFW-b"))
          (hsPkgs."GLUtil" or (buildDepError "GLUtil"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."linear" or (buildDepError "linear"))
          (hsPkgs."mvc" or (buildDepError "mvc"))
          (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          (hsPkgs."pipes-misc" or (buildDepError "pipes-misc"))
          (hsPkgs."pipes-extras" or (buildDepError "pipes-extras"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."Vec" or (buildDepError "Vec"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."vinyl" or (buildDepError "vinyl"))
          (hsPkgs."vinyl-gl" or (buildDepError "vinyl-gl"))
          ];
        buildable = true;
        };
      exes = {
        "liveplot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."liveplot" or (buildDepError "liveplot"))
            ];
          buildable = true;
          };
        };
      };
    }