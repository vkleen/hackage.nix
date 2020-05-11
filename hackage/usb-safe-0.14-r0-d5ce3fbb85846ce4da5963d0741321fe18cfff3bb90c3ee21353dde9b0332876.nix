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
      identifier = { name = "usb-safe"; version = "0.14"; };
      license = "BSD-3-Clause";
      copyright = "2009–2010 Bas van Dijk";
      maintainer = "Bas van Dijk <v.dijk.bas@gmail.com>";
      author = "Bas van Dijk <v.dijk.bas@gmail.com>";
      homepage = "https://github.com/basvandijk/usb-safe/";
      url = "";
      synopsis = "Type-safe communication with USB devices.";
      description = "The @usb@ package provides a standard Haskell abstraction layer over\n@bindings-libusb@ providing: abstract types instead of @Ptr@s, automatic\nmarshalling and unmarshalling, automatic garbage collection,\nexceptions instead of integer return codes, etc..\n\nWhile all that is very nice there are still some things that you can\ndo wrong. For example doing I/O with a closed device or reading from\nor writing to an endpoint which doesn't belong to the claimed\ninterface. Or reading from an Out endpoint or writing to an In\nendpoint.\n\n@usb-safe@ provides the following guarantees:\n\n* You can't reference handles to devices that are closed. In other words: no\nI/O with closed handles is possible.\n\n* The programmer specifies the /region/ in which devices should remain open. On\nexit from the region the opened devices will be closed automatically.\n\n* You can't reference handles to configurations that have not been set.\n\n* You can't reference handles to interfaces that have not been claimed.\n\n* Just like with devices, the programmer can specify the region in\nwhich interfaces should remain claimed. On exit from the region\nthe claimed interfaces will be released automatically.\n\n* You can't reference handles to alternates that have not been set.\n\n* You can't reference endpoints that don't belong to a setted alternate.\n\n* You can't read from an endpoint with an Out transfer direction.\n\n* You can't write to an endpoint with an In transfer direction.\n\nThe primary technique used in usb-safe is called \\\"Lightweight monadic\nregions\\\" which was invented by Oleg Kiselyov and Chung-chieh Shan.\nSee:\n\n<http://okmij.org/ftp/Haskell/regions.html#light-weight>\n\nThis technique is implemented in the @regions@ package which is\nre-exported from @usb-safe@.\n\nSee the @usb-safe-examples@ package for examples how to use this library:\n\n@git clone <https://github.com/basvandijk/usb-safe-examples>@";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-unicode-symbols" or (buildDepError "base-unicode-symbols"))
          (hsPkgs."usb" or (buildDepError "usb"))
          (hsPkgs."bindings-libusb" or (buildDepError "bindings-libusb"))
          (hsPkgs."iteratee" or (buildDepError "iteratee"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."regions" or (buildDepError "regions"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }