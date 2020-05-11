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
      identifier = {
        name = "bronyradiogermany-streaming";
        version = "1.0.0.0";
        };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "darcs@m.doomanddarkness.eu";
      author = "Marvin Cohrs";
      homepage = "";
      url = "";
      synopsis = "Streaming interface for the BronyRadioGermany API.";
      description = "This is a streaming interface for the API of BronyRadioGermany. Features: get the currently played song, the entire song history, the AutoDj track list, vote statistics, and the raw audio streams; it can also post up- and downvotes, as well as song requests. If you prefer conduit over streaming, please have a look at bronyradiogermany-conduit.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."streaming" or (buildDepError "streaming"))
          (hsPkgs."streaming-bytestring" or (buildDepError "streaming-bytestring"))
          (hsPkgs."streaming-utils" or (buildDepError "streaming-utils"))
          (hsPkgs."bronyradiogermany-common" or (buildDepError "bronyradiogermany-common"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          ];
        buildable = true;
        };
      };
    }