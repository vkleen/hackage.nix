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
    flags = { exe = false; };
    package = {
      specVersion = "1.14";
      identifier = { name = "HsYAML"; version = "0.1.0.0"; };
      license = "GPL-3.0-only";
      copyright = "2015-2018 Herbert Valerio Riedel\n, 2007-2008 Oren Ben-Kiki";
      maintainer = "hvr@gnu.org";
      author = "Herbert Valerio Riedel";
      homepage = "https://github.com/hvr/HsYAML";
      url = "";
      synopsis = "Pure Haskell YAML 1.2 parser";
      description = "@HsYAML@ is a [YAML 1.2](http://yaml.org/spec/1.2/spec.html) parser for Haskell.\n\nFeatures include:\n\n* Pure Haskell implementation with small dependency footprint and emphasis on strict compliance with the [YAML 1.2 specification](http://yaml.org/spec/1.2/spec.html)\n* Low-level API access to lexical token-based scanner (\"Data.YAML.Token\")\n* Event-based API resembling LibYAML's Event-based API (\"Data.YAML.Event\")\n* Support for constructing custom YAML node graph representation (including support for cyclic YAML data structures)\n* Direct decoding via typeclass-based API similiar to @aeson@ (\"Data.YAML\")\n* Support for /Failsafe/, /JSON/ and /Core/ schemas as defined in the YAML 1.2 specification (including support for user-defined custom schemas)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          ];
        buildable = true;
        };
      exes = {
        "yaml-test" = {
          depends = (pkgs.lib).optionals (flags.exe) [
            (hsPkgs."HsYAML" or (buildDepError "HsYAML"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."microaeson" or (buildDepError "microaeson"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = if flags.exe then true else false;
          };
        };
      };
    }