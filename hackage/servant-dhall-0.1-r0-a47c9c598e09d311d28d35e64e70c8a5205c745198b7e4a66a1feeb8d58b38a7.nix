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
      identifier = { name = "servant-dhall"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "2018 Servant Contributors";
      maintainer = "haskell-servant-maintainers@googlegroups.com";
      author = "Servant Contributors";
      homepage = "http://haskell-servant.readthedocs.org/";
      url = "";
      synopsis = "Servant Dhall content-type";
      description = "Servant Dhall bindings.\n\nProvides @MimeRender@ and @MimeUnrender@ instances.\nSo you can accept and return Dhall expressions.\n\n/Note:/ Reading (and evaluating) Dhall expressions from untrusted sources is a security risk.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-compat" or (buildDepError "base-compat"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."dhall" or (buildDepError "dhall"))
          (hsPkgs."formatting" or (buildDepError "formatting"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."http-media" or (buildDepError "http-media"))
          ];
        buildable = true;
        };
      tests = {
        "example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."dhall" or (buildDepError "dhall"))
            (hsPkgs."http-media" or (buildDepError "http-media"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-dhall" or (buildDepError "servant-dhall"))
            (hsPkgs."servant-server" or (buildDepError "servant-server"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            ];
          buildable = true;
          };
        };
      };
    }