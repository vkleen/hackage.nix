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
      identifier = { name = "shelly"; version = "0.5.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Greg Weber <greg@gregweber.info>";
      author = "Greg Weber, Petr Rockai";
      homepage = "https://github.com/yesodweb/Shelly.hs";
      url = "";
      synopsis = "shell-like (systems) programming in Haskell";
      description = "Shelly is a package provides a single module for convenient\nsystems programming in Haskell, similar in spirit to POSIX\nshells.\n\n* Shelly is aimed at getting things done rather than\nbeing a demonstration of elegance.\n\n* Shelly maintains its own environment, making it thread-safe.\n\n* Shelly is modern. It uses Text and system-filepath/system-fileio\n\nThese are all in contrast to HSH. Elegance in HSH comes from polymorphic input and output.\n\nShelly is a fork of Shellish that features low memory usage, bug fixes, and modernization";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }