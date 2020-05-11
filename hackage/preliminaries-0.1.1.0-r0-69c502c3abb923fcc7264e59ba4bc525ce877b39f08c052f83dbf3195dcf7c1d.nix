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
      identifier = { name = "preliminaries"; version = "0.1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "© 2016 Yghor Kerscher";
      maintainer = "kerscher@acm.org";
      author = "Yghor Kerscher";
      homepage = "http://github.com/kerscher/preliminaries";
      url = "";
      synopsis = "A larger alternative to the Prelude.";
      description = "A GHC-only alternative to the Prelude with a large amount of imports available by default.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."classy-prelude-conduit" or (buildDepError "classy-prelude-conduit"))
          (hsPkgs."abstract-par" or (buildDepError "abstract-par"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."microlens-platform" or (buildDepError "microlens-platform"))
          (hsPkgs."microlens-contra" or (buildDepError "microlens-contra"))
          (hsPkgs."monad-par" or (buildDepError "monad-par"))
          (hsPkgs."monad-parallel" or (buildDepError "monad-parallel"))
          (hsPkgs."mono-traversable-instances" or (buildDepError "mono-traversable-instances"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."stm-conduit" or (buildDepError "stm-conduit"))
          ];
        buildable = true;
        };
      };
    }