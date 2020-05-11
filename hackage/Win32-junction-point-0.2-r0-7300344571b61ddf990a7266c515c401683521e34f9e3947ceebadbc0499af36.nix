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
      specVersion = "1.16";
      identifier = { name = "Win32-junction-point"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2011-2014, Michael Steele. Copyright (c) 2000, Mikael Nordell";
      maintainer = "mikesteele81@gmail.com";
      author = "Michael Steele";
      homepage = "http://github.com/mikesteele81/Win32-junction-point";
      url = "";
      synopsis = "Support for manipulating NTFS junction points.";
      description = "This package provides the ability to manipulate NTFS junction points as\nsupported by Windows 2000 and above. Junction points, along with NTFS hard\nlinks and NTFS symbolic links, are a type of symbolic link that can be made\nbetween folders existing on the same filesystem. Please read Microsoft\nKB205524 [1] for more information on junction points.\n\nJunction points have always been left undocumented in the Win32 SDK. The\nWindows 2000 Resource Kit came with a command-line utility named linkd.exe\nto work with them. Later, Mark Russinovich of SysInternals distributed a\nreplacement utility named Junction [2] which accomplished the same thing.\n\nThis source code is based on an article [3] and C++ library [4] written by\nMike Nordell at codeproject.com.\n\nIt is against Microsoft's recommendation to make use of undocumented API\nfeatures. Use this library at your own risk.\n\n(1) <http://support.microsoft.com/?kbid=205524>\n\n(2) <http://technet.microsoft.com/en-us/sysinternals/bb896768>\n\n(3) <http://www.codeproject.com/script/Articles/ViewDownloads.aspx?aid=194>\n\n(4) <http://www.codeproject.com/KB/winsdk/junctionpoints.aspx>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."Win32" or (buildDepError "Win32"))
          (hsPkgs."Win32-errors" or (buildDepError "Win32-errors"))
          ];
        buildable = true;
        };
      };
    }