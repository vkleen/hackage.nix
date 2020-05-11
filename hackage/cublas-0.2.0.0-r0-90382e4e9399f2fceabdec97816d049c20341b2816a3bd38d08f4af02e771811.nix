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
      identifier = { name = "cublas"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) [2012..2014]. Trevor L. McDonell <tmcdonell@cse.unsw.edu.au>, Ben Sherman <benmsherman@gmail.com>";
      maintainer = "Ben Sherman <benmsherman@gmail.com>";
      author = "Trevor L. McDonell, Ben Sherman";
      homepage = "";
      url = "";
      synopsis = "FFI bindings to the CUDA CUBLAS and CUSPARSE libraries";
      description = "This package provides FFI bindings to the NVIDIA CUDA CUBLAS and CUSPARSE\nlinear algebra GPU BLAS implementations. The modules\n@Foreign.CUDA.Cublas@ and @Foreign.CUDA.Cusparse@ are probably the most\nuseful.\n\nIf you have trouble installing this package, it may help to view this\nwebpage: <http://github.com/bmsherman/cublas>";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cuda" or (buildDepError "cuda"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."language-c" or (buildDepError "language-c"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."storable-complex" or (buildDepError "storable-complex"))
          ];
        libs = [
          (pkgs."cublas" or (sysDepError "cublas"))
          (pkgs."cusparse" or (sysDepError "cusparse"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs or (pkgs.buildPackages.c2hs or (buildToolDepError "c2hs")))
          ];
        buildable = true;
        };
      };
    }