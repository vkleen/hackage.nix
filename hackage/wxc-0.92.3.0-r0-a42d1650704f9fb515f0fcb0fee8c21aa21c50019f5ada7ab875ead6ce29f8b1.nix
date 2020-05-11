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
      specVersion = "1.23";
      identifier = { name = "wxc"; version = "0.92.3.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "wxhaskell-devel@lists.sourceforge.net";
      author = "";
      homepage = "https://wiki.haskell.org/WxHaskell";
      url = "";
      synopsis = "wxHaskell C++ wrapper";
      description = "wxHaskell is a portable and native GUI library for Haskell. It is\nbuilt on top of wxWidgets, a comprehensive C++ library that is\nportable across all major GUI platforms, including GTK, Windows,\nX11, and MacOS X. This version works with wxWidgets 2.9 and 3.0.\nDistributed under the WXWINDOWS LIBRARY LICENSE. Please see\nLICENSE file, but note that this is essentially LGPL with an\nexception allowing binary distribution of proprietary software.\nThis is the same license as wxWidgets itself uses.";
      buildType = "Custom";
      setup-depends = [
        (hsPkgs.buildPackages.base or (pkgs.buildPackages.base or (buildToolDepError "base")))
        (hsPkgs.buildPackages.Cabal or (pkgs.buildPackages.Cabal or (buildToolDepError "Cabal")))
        (hsPkgs.buildPackages.bytestring or (pkgs.buildPackages.bytestring or (buildToolDepError "bytestring")))
        (hsPkgs.buildPackages.split or (pkgs.buildPackages.split or (buildToolDepError "split")))
        (hsPkgs.buildPackages.process or (pkgs.buildPackages.process or (buildToolDepError "process")))
        (hsPkgs.buildPackages.directory or (pkgs.buildPackages.directory or (buildToolDepError "directory")))
        (hsPkgs.buildPackages.filepath or (pkgs.buildPackages.filepath or (buildToolDepError "filepath")))
        ];
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."wxdirect" or (buildDepError "wxdirect"))
          (hsPkgs."split" or (buildDepError "split"))
          ];
        buildable = true;
        };
      };
    }