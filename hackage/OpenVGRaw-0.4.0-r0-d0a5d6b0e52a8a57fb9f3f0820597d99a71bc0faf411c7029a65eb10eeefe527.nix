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
      identifier = { name = "OpenVGRaw"; version = "0.4.0"; };
      license = "BSD-3-Clause";
      copyright = "Stephen Tetley <stephen.tetley@gmail.com>";
      maintainer = "Stephen Tetley <stephen.tetley@gmail.com>";
      author = "";
      homepage = "http://code.google.com/p/copperbox/";
      url = "";
      synopsis = "Raw binding to OpenVG (ShivaVG-0.2.1 implementation).";
      description = "A raw Haskell binding to OpenVG vector graphics API version\n1.0.1, specifically the ShivaVG-0.2.1 implementation.\n\nFollowing Sven Panne\\'s OpenGL model this is essentially a 1:1\nmapping between the OpenVG C API and Haskell and is expected\nto be used in concert with the higher-level @OpenVG@ pacakge.\n\nDetailed install instructions for Windows (MinGW/MSYS) are\nincluded in the @OpenVG@ package.\n\nChangelog\n\nv0.3.0 to v0.4.0\n\n* Re-fixed imports to work with GHC 7.6.\nSeemingly I missed uploading V0.3.0 to Hackage in August\n2012.\n\nv0.2.0 to v0.3.0\n\n* Fixed imports\n\nv0.1.0 to v0.2.0\n\n* Changed type of vgGetMatrix\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."OpenGLRaw" or (buildDepError "OpenGLRaw"))
          ];
        buildable = true;
        };
      };
    }