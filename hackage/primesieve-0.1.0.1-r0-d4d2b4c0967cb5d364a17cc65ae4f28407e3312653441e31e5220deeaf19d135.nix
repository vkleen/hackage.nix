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
      identifier = { name = "primesieve"; version = "0.1.0.1"; };
      license = "MIT";
      copyright = "Copyright: (c) 2017 HE, Tao";
      maintainer = "sighingnow@gmail.com";
      author = "HE, Tao";
      homepage = "https://github.com/sighingnow/computations/tree/master/primesieve#readme";
      url = "";
      synopsis = "FFI bindings for the primesieve library.";
      description = "FFI bindings for the primesieve library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."foundation" or (buildDepError "foundation"))
          ];
        buildable = true;
        };
      exes = {
        "prime-count" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."foundation" or (buildDepError "foundation"))
            (hsPkgs."primesieve" or (buildDepError "primesieve"))
            ];
          libs = [ (pkgs."primesieve" or (sysDepError "primesieve")) ];
          buildable = true;
          };
        "prime-example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."foundation" or (buildDepError "foundation"))
            (hsPkgs."primesieve" or (buildDepError "primesieve"))
            ];
          libs = [ (pkgs."primesieve" or (sysDepError "primesieve")) ];
          buildable = true;
          };
        };
      };
    }