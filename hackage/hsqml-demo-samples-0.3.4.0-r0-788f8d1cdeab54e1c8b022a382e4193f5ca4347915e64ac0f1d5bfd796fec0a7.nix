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
    flags = { opengl = true; };
    package = {
      specVersion = "1.10";
      identifier = { name = "hsqml-demo-samples"; version = "0.3.4.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2014-2016 Robin KAY";
      maintainer = "komadori@gekkou.co.uk";
      author = "Robin KAY";
      homepage = "http://www.gekkou.co.uk/software/hsqml/";
      url = "";
      synopsis = "HsQML sample programs";
      description = "HsQML sample programs";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hsqml-factorial1" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hsqml" or (buildDepError "hsqml"))
            ];
          buildable = true;
          };
        "hsqml-factorial2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hsqml" or (buildDepError "hsqml"))
            ];
          buildable = true;
          };
        "hsqml-model1" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hsqml" or (buildDepError "hsqml"))
            ];
          buildable = true;
          };
        "hsqml-opengl1" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
            (hsPkgs."OpenGLRaw" or (buildDepError "OpenGLRaw"))
            (hsPkgs."hsqml" or (buildDepError "hsqml"))
            ];
          buildable = if !flags.opengl then false else true;
          };
        "hsqml-opengl2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
            (hsPkgs."OpenGLRaw" or (buildDepError "OpenGLRaw"))
            (hsPkgs."hsqml" or (buildDepError "hsqml"))
            ];
          buildable = if !flags.opengl then false else true;
          };
        };
      };
    }