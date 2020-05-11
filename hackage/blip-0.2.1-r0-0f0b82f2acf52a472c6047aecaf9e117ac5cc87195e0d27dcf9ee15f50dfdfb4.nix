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
      specVersion = "1.8";
      identifier = { name = "blip"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Bernie Pope <florbitous@gmail.com>";
      author = "Bernie Pope";
      homepage = "https://github.com/bjpop/blip  ";
      url = "";
      synopsis = "Python to bytecode compiler.";
      description = "Compiles Python 3 source code to bytecode. The resulting\nbytecode is written to a '.pyc' file, compatible with the\nCPython implementation (the default Python interpreter).";
      buildType = "Simple";
      };
    components = {
      exes = {
        "blip" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bliplib" or (buildDepError "bliplib"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."parseargs" or (buildDepError "parseargs"))
            (hsPkgs."language-python" or (buildDepError "language-python"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            ];
          buildable = true;
          };
        };
      };
    }