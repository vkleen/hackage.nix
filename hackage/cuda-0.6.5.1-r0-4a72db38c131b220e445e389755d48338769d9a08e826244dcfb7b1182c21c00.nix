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
      identifier = { name = "cuda"; version = "0.6.5.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) [2009..2014]. Trevor L. McDonell <tmcdonell@cse.unsw.edu.au>";
      maintainer = "Trevor L. McDonell <tmcdonell@cse.unsw.edu.au>";
      author = "Trevor L. McDonell <tmcdonell@cse.unsw.edu.au>";
      homepage = "https://github.com/tmcdonell/cuda";
      url = "";
      synopsis = "FFI binding to the CUDA interface for programming NVIDIA GPUs";
      description = "The CUDA library provides a direct, general purpose C-like SPMD programming\nmodel for NVIDIA graphics cards (G8x series onwards). This is a collection\nof bindings to allow you to call and control, although not write, such\nfunctions from Haskell-land. You will need to install the CUDA driver and\ndeveloper toolkit.\n\n<http://developer.nvidia.com/cuda-downloads>\n\nThe configure script will look for your CUDA installation in the standard\nplaces, and if the nvcc compiler is found in your PATH, relative to that.\n\nThis release is for version 6.5 of the CUDA toolkit.\n\n[/NOTE:/]\n\nDue to a bug in nvcc, this package is not compatible with c2hs-0.18.* or\nc2hs-0.19.*. See tmcdonell/cuda#18.\n";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs or (pkgs.buildPackages.c2hs or (buildToolDepError "c2hs")))
          (hsPkgs.buildPackages.hsc2hs or (pkgs.buildPackages.hsc2hs or (buildToolDepError "hsc2hs")))
          ];
        buildable = true;
        };
      exes = {
        "nvidia-device-query" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."cuda" or (buildDepError "cuda"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            ];
          buildable = true;
          };
        };
      };
    }