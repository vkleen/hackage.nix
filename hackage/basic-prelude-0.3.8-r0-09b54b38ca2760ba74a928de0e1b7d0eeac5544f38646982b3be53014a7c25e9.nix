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
      identifier = { name = "basic-prelude"; version = "0.3.8"; };
      license = "MIT";
      copyright = "";
      maintainer = "michael@snoyman.com";
      author = "Michael Snoyman, Dan Burton";
      homepage = "https://github.com/snoyberg/basic-prelude";
      url = "";
      synopsis = "An enhanced core prelude; a common foundation for alternate preludes.";
      description = "The premise of @basic-prelude@ is that there are a lot of very commonly desired features missing from the standard @Prelude@, such as commonly used operators (@\\<\$\\>@ and @>=>@, for instance) and imports for common datatypes (e.g., @ByteString@ and @Vector@). At the same time, there are lots of other components which are more debatable, such as providing polymorphic versions of common functions.\n\nSo @basic-prelude@ is intended to give a common foundation for a number of alternate preludes. The package provides two modules: @CorePrelude@ provides the common ground for other preludes to build on top of, while @BasicPrelude@ exports @CorePrelude@ together with commonly used list functions to provide a drop-in replacement for the standard @Prelude@.\n\nUsers wishing to have an improved @Prelude@ can use @BasicPrelude@. Developers wishing to create a new prelude should use @CorePrelude@.\n\nRelease history:\n\n[0.3] Moved a number of exports from @BasicPrelude@ to @CorePrelude@ and vice-versa.\n\n[0.2] Renamed @BasicPrelude@ to @CorePrelude@ and added a new @BasicPrelude@ module provided a full-featured @Prelude@ alternative. Also added a number of new exports.\n\n[0.1] Initial version, code taken from @classy-prelude@ with a few minor tweaks.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."ReadArgs" or (buildDepError "ReadArgs"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."safe" or (buildDepError "safe"))
          ];
        buildable = true;
        };
      };
    }