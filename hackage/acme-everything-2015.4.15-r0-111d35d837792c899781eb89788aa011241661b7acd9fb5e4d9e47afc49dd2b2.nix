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
      identifier = { name = "acme-everything"; version = "2015.4.15"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "David Luposchainsky <dluposchainsky(λ)gmail.com>";
      author = "David Luposchainsky";
      homepage = "";
      url = "";
      synopsis = "Everything.";
      description = "Install some packages.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."3d-graphics-examples" or (buildDepError "3d-graphics-examples"))
          (hsPkgs."3dmodels" or (buildDepError "3dmodels"))
          (hsPkgs."4Blocks" or (buildDepError "4Blocks"))
          (hsPkgs."ABList" or (buildDepError "ABList"))
          (hsPkgs."AC-Angle" or (buildDepError "AC-Angle"))
          (hsPkgs."AC-Boolean" or (buildDepError "AC-Boolean"))
          (hsPkgs."AC-BuildPlatform" or (buildDepError "AC-BuildPlatform"))
          (hsPkgs."AC-Colour" or (buildDepError "AC-Colour"))
          (hsPkgs."AC-EasyRaster-GTK" or (buildDepError "AC-EasyRaster-GTK"))
          (hsPkgs."AC-HalfInteger" or (buildDepError "AC-HalfInteger"))
          ];
        buildable = true;
        };
      };
    }