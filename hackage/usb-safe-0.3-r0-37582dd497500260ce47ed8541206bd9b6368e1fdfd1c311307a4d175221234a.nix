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
      identifier = { name = "usb-safe"; version = "0.3"; };
      license = "BSD-3-Clause";
      copyright = "2009 Bas van Dijk";
      maintainer = "Bas van Dijk <v.dijk.bas@gmail.com>";
      author = "Bas van Dijk";
      homepage = "";
      url = "";
      synopsis = "Wrapper around the usb package adding extra type-safety";
      description = "The usb library provides a standard Haskell abstracting layer over\nbindings-libusb providing: abstract types instead of Ptrs, automatic\nmarshalling and unmarshalling, automatic garbage collection,\nexceptions instead of integer return codes, etc..\n\nWhile all that is very nice there are still some things that you can\ndo wrong. For example doing I/O with a closed device or reading from\nor writing to an endpoint which doesn't belong to the claimed\ninterface. Or reading from an Out endpoint or writing to an In\nendpoint.\n\nusb-safe provides the following guarantees:\n\n* You can't reference handles to devices that are closed. In other words: no\nI/O with closed handles is possible.\n\n* The programmer specifies the region in which devices should remain open. On\nexit from the region the opened devices are automatically closed.\n\n* You can't reference handles to configurations that have not been set.\n\n* You can't reference handles to interfaces that have not been claimed.\n\n* You can't reference handles to alternates that have not been set.\n\n* You can't reference endpoints that don't belong to a setted alternate.\n\n* You can't read from an endpoint with an Out transfer direction.\n\n* You can't write to an endpoint with an In transfer direction.\n\n* You can't read from or write to endpoints with the unsupported transfer\ntypes Control and Isochronous. Only I/O with endpoints with the Bulk and\nInterrupt transfer types is allowed.\n\nThe primary technique used in usb-safe is called \\\"Lightweight monadic\nregions\\\" which was invented by Oleg Kiselyov and Chung-chieh Shan.\nSee:\n\n<http://okmij.org/ftp/Haskell/regions.html#light-weight>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."usb" or (buildDepError "usb"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."unicode-symbols" or (buildDepError "unicode-symbols"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."MonadCatchIO-transformers" or (buildDepError "MonadCatchIO-transformers"))
          (hsPkgs."monads-fd" or (buildDepError "monads-fd"))
          ];
        buildable = true;
        };
      };
    }