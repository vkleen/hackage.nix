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
      identifier = { name = "yaya-unsafe"; version = "0.1.1.2"; };
      license = "AGPL-3.0-only";
      copyright = "2017 Greg Pfeil";
      maintainer = "greg@technomadic.org";
      author = "Greg Pfeil";
      homepage = "https://github.com/sellout/yaya#readme";
      url = "";
      synopsis = "Non-total extensions to the Yaya recursion scheme library.";
      description = "Yaya is designed as a _total_ library. However, it is often\nexpedient to use partial operations in some cases, and this\npackage extends Yaya to provide those operations. It’s in a\nseparate package (and modules) in order to make sure its\nuse is very intentional and also relatively obvious to\nthose reading your code. It’s recommended that you import\nthese modules qualified and, in particular, all the type\nclass instances here have been pulled into a separate\nmodule to avoid accidentally bringing them into scope.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."yaya" or (buildDepError "yaya"))
          ];
        buildable = true;
        };
      };
    }