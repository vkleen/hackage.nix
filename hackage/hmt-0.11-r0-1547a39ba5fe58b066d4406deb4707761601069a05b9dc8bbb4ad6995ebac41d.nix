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
      identifier = { name = "hmt"; version = "0.11"; };
      license = "LicenseRef-GPL";
      copyright = "Rohan Drape, 2006-2011";
      maintainer = "rd@slavepianos.org";
      author = "Rohan Drape";
      homepage = "http://slavepianos.org/rd/?t=hmt";
      url = "";
      synopsis = "Haskell Music Theory";
      description = "Haskell music theory library";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cairo" or (buildDepError "cairo"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hcg-minus" or (buildDepError "hcg-minus"))
          (hsPkgs."html-minimalist" or (buildDepError "html-minimalist"))
          (hsPkgs."multiset-comb" or (buildDepError "multiset-comb"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."permutation" or (buildDepError "permutation"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."xml" or (buildDepError "xml"))
          ];
        buildable = true;
        };
      };
    }