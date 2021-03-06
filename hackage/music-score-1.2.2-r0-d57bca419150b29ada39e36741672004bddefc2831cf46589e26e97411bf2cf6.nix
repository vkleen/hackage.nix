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
      specVersion = "1.2";
      identifier = { name = "music-score"; version = "1.2.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Hans Hoglund";
      author = "Hans Hoglund";
      homepage = "";
      url = "";
      synopsis = "Musical score and part representation.";
      description = "Musical score and part representation.\nThis library is part of the Haskell Music Suite, see <http://musicsuite.github.com>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."HCodecs" or (buildDepError "HCodecs"))
          (hsPkgs."musicxml2" or (buildDepError "musicxml2"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."nats" or (buildDepError "nats"))
          (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          (hsPkgs."music-pitch-literal" or (buildDepError "music-pitch-literal"))
          (hsPkgs."music-dynamics-literal" or (buildDepError "music-dynamics-literal"))
          (hsPkgs."reenact" or (buildDepError "reenact"))
          ];
        buildable = true;
        };
      exes = { "music-score-tests" = { buildable = true; }; };
      };
    }