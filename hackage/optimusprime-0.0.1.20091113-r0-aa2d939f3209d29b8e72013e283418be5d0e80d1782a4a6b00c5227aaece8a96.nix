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
      identifier = { name = "optimusprime"; version = "0.0.1.20091113"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Jason Reich <jason@cs.york.ac.uk>";
      author = "Jason Reich <jason@cs.york.ac.uk>";
      homepage = "http://optimusprime.posterous.com/";
      url = "";
      synopsis = "A supercompiler for f-lite";
      description = "A supercompiler for f-lite";
      buildType = "Simple";
      };
    components = {
      exes = {
        "optimusprime" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."flite" or (buildDepError "flite"))
            (hsPkgs."uniplate" or (buildDepError "uniplate"))
            (hsPkgs."wl-pprint" or (buildDepError "wl-pprint"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."graphviz" or (buildDepError "graphviz"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            ];
          buildable = true;
          };
        };
      };
    }