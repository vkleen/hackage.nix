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
      specVersion = "1.6";
      identifier = { name = "Ebnf2ps"; version = "1.0.14"; };
      license = "BSD-3-Clause";
      copyright = "1993-2014";
      maintainer = "Franklin Chen <franklinchen@franklinchen.com>";
      author = "Peter Thiemann <thiemann@acm.org>";
      homepage = "https://github.com/FranklinChen/Ebnf2ps";
      url = "";
      synopsis = "Peter's Syntax Diagram Drawing Tool";
      description = "Ebnf2ps generates nice looking syntax diagrams in EPS\nand FIG format from EBNF specifications and from yacc,\nbison, and Happy input grammars. The diagrams can be\nimmediatedly included in TeX/LaTeX documents and in\ntexts created with other popular document preparation\nsystems.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "ebnf2ps" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.happy or (pkgs.buildPackages.happy or (buildToolDepError "happy")))
            ];
          buildable = true;
          };
        };
      };
    }