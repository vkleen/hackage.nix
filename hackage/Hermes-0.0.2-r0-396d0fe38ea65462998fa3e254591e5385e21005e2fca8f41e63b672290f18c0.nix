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
      identifier = { name = "Hermes"; version = "0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2010, University of Tromsø";
      maintainer = "Svein Ove Aas <svein.ove@aas.no>";
      author = "Svein Ove Aas <svein.ove@aas.no>";
      homepage = "";
      url = "";
      synopsis = "Message-based middleware layer";
      description = "A middleware providing best-effort unicast, remote procedure calls,\nprobabilistic (and slow!) broadcast and automatic membership\nmanagement, meant for small to medium networks";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."AES" or (buildDepError "AES"))
          (hsPkgs."SHA2" or (buildDepError "SHA2"))
          (hsPkgs."RSA" or (buildDepError "RSA"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."yjtools" or (buildDepError "yjtools"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."monads-tf" or (buildDepError "monads-tf"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."unamb" or (buildDepError "unamb"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }