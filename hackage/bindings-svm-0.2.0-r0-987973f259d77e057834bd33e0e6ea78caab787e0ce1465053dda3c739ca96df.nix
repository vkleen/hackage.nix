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
      specVersion = "1.2.3";
      identifier = { name = "bindings-svm"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Paulo Tanimoto <ptanimoto@gmail.com>\nVille Tirronen <aleator@gmail.com>";
      author = "Paulo Tanimoto <ptanimoto@gmail.com>\nVille Tirronen <aleator@gmail.com>";
      homepage = "http://github.com/tanimoto/bindings-svm";
      url = "";
      synopsis = "Low level bindings to libsvm.";
      description = "Low level bindings to libsvm <http://www.csie.ntu.edu.tw/~cjlin/libsvm/>.\n\nChanges in version 0.2.0\n\n* Updated to libsvm 3.1\n\n* Include libsvm with the package\n\n* Drop dependency on @pkg-config@\n\nChanges in version 0.1.0\n\n* Initial version\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
          ];
        libs = [ (pkgs."stdc++" or (sysDepError "stdc++")) ];
        buildable = true;
        };
      };
    }