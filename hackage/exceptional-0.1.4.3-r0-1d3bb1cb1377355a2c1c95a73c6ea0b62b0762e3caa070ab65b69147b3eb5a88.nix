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
      identifier = { name = "exceptional"; version = "0.1.4.3"; };
      license = "BSD-2-Clause";
      copyright = "Copyright (c) 2015, Peter Harpending.";
      maintainer = "peter@harpending.org";
      author = "Peter Harpending";
      homepage = "https://github.com/pharpend/exceptional";
      url = "";
      synopsis = "Essentially the Maybe type with error messages.";
      description = "This is a very simple type:\n\n> data Exceptional x\n>   = Failure String\n>   | Success x\n\nIt's much like @Maybe@, except instead of @Nothing@, we have @Failure\nString@.\n\nA comparison could also be made to @Either String@. I made this library\nbecause I was dissatisfied with the @Monad@ instance for @Either@. In this\ntype, @fail = Failure@. It's rather simple.\n\nChanges\n\n[0.1.4.3] Fix bug where @exceptional@ won't compile on @base < 4.8@.\nAlso move the changelog back to the description so it's more\nvisible.\n\n[0.1.4.2] Moved change log to a separate file so Hackage displays\nit correctly.\n\n[0.1.4.1] Documentation enhancements/fixes.\n\n[0.1.4.0] Added @fromMaybe@ and @toMaybe@ functions, and a link to\nthe bug tracker.\n\n[0.1.3.0] Fixed a typo. 0.1.2.0 won't build. Also added definition\nof @empty@ for @Alternative@.\n\n[0.1.2.0] Added @fromEither@ and @toEither@ functions.\n\n[0.1.1.3] Hackage is terrible. Yet another formatting fix.\n\n[0.1.1.2] Yet another formatting fix.\n\n[0.1.1.1] Formatting fix to the haddock documentation.\n\n[0.1.1.0] Add @runExceptional@ function.\n\n[0.1.0.1] Minor documentation changes. No changes to the API.\n\n[0.1.0.0] Initial version";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }