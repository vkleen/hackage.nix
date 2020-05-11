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
    flags = { llvm = false; multiconflict = false; utils = false; };
    package = {
      specVersion = "1.16";
      identifier = { name = "mios"; version = "1.5.4"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "Shuji Narazaki <narazaki@nagasaki-u.ac.jp>";
      author = "Shuji Narazaki <narazaki@nagasaki-u.ac.jp>";
      homepage = "https://github.com/shnarazk/mios";
      url = "";
      synopsis = "A Minisat-based CDCL SAT solver in Haskell";
      description = "A modern and very fast SAT solver written in Haskell, using CDCL, watch literals, VSIDS,\nblocking-literals, phase saving, LBD, Glucose-like restart and so on.\n'Mios' is an abbreviation of 'Minisat-based Implementation and Optimization Study on SAT solver'.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          ];
        buildable = true;
        };
      exes = {
        "mios-1.5.4" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            ];
          buildable = true;
          };
        "cnf-stat" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.utils then true else false;
          };
        "mios-mc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.multiconflict then true else false;
          };
        "mc-dump2csv" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.multiconflict && flags.utils
            then true
            else false;
          };
        "mc-averagecsv" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.multiconflict && flags.utils
            then true
            else false;
          };
        "mc-summary" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.multiconflict && flags.utils
            then true
            else false;
          };
        "mc-stat2csv" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.multiconflict && flags.utils
            then true
            else false;
          };
        "mc-pickup" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.multiconflict && flags.utils
            then true
            else false;
          };
        "mc-numbers" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mios" or (buildDepError "mios"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = if flags.multiconflict && flags.utils
            then true
            else false;
          };
        };
      };
    }