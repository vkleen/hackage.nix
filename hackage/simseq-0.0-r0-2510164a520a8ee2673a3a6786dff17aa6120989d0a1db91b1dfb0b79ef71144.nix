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
      specVersion = "0";
      identifier = { name = "simseq"; version = "0.0"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Ketil Malde <ketil@malde.org>";
      author = "Ketil Malde";
      homepage = "http://malde.org/~ketil/";
      url = "";
      synopsis = "Simulate sequencing with different models for priming and errors";
      description = "This is a simulator that can generate simulated sequences -- primarily EST type sequences,\nbut quite possibly other types as well. Mail me for further information on usage etc.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "simseq" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bio" or (buildDepError "bio"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }