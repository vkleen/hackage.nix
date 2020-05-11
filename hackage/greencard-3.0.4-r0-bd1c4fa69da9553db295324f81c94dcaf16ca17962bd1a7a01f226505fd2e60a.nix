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
      specVersion = "1.2";
      identifier = { name = "greencard"; version = "3.0.4"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sigbjorn Finne <sof@forkIO.com>";
      author = "Alastair Reid <alastair@reid-consulting-uk.ltd.uk>, Sigbjorn Finne <sof@forkIO.com>, Thomas Nordin.";
      homepage = "";
      url = "";
      synopsis = "GreenCard, a foreign function pre-processor for Haskell.";
      description = "Green Card is a foreign function interface preprocessor for Haskell, simplifying the\ntask of interfacing Haskell programs to external libraries (which are normally\nexposed via C interfaces).\n\nTo interface to an external function using Green Card, you write a small procedure\nspecification. The specification tells Green Card what (Haskell) type you want to\ngive the function together with details of how the arguments (and results) to the\nHaskell function should be marshalled to and from the data representation used by\nthe external function. Green Card will then generate gobs of low-level boilerplate\ncode that takes care of all the details.\n\nFor an example of a simple GreenCard module, have a look at @examples\\/world\\/World.gc@\n\nAlong with the @greencard@ application binary, this package also supplies the @greencard@\nlibrary/package, consisting of the single module @Foreign.GreenCard@ containing the default\nGreenCard marshalling functions.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      exes = {
        "greencard" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          buildable = true;
          };
        };
      };
    }