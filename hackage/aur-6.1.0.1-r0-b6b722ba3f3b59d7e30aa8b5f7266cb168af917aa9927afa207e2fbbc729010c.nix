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
      specVersion = "2.2";
      identifier = { name = "aur"; version = "6.1.0.1"; };
      license = "GPL-3.0-only";
      copyright = "2014 - 2019 Colin Woodbury";
      maintainer = "colin@fosskers.ca";
      author = "Colin Woodbury";
      homepage = "https://github.com/aurapm/aura";
      url = "";
      synopsis = "Access metadata from the Arch Linux User Repository.";
      description = "Access package information from Arch Linux's AUR via its RPC interface. The\nmain exposed functions reflect those of the RPC. `info` gets metadata for\none package. `search` gets limited metadata for packages that match a given\nregex. By default this library supports version 5 of the RPC, and hence\nversion 4.2+ of the AUR.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."errors" or (buildDepError "errors"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."servant-client" or (buildDepError "servant-client"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      tests = {
        "aur-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."aur" or (buildDepError "aur"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        };
      };
    }