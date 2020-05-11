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
      specVersion = "1.9.2";
      identifier = { name = "hjsmin"; version = "0.2.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Erik de Castro Lopo <erikd@mega-nerd.com>";
      author = "Alan Zimmerman <alan.zimm@gmail.com>";
      homepage = "http://github.com/erikd/hjsmin";
      url = "";
      synopsis = "Haskell implementation of a javascript minifier";
      description = "Reduces size of javascript files by stripping out extraneous whitespace and\nother syntactic elements, without changing the semantics.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."language-javascript" or (buildDepError "language-javascript"))
          ];
        buildable = true;
        };
      exes = {
        "hjsmin" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."language-javascript" or (buildDepError "language-javascript"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            ];
          buildable = true;
          };
        };
      };
    }