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
    flags = { base4 = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "netlist-to-vhdl"; version = "0.3.3"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2010 University of Kansas";
      maintainer = "garrin.kimmell@gmail.com";
      author = "Garrin Kimmell";
      homepage = "";
      url = "git://github.com/ku-fpg/netlist.git";
      synopsis = "Convert a Netlist AST to VHDL";
      description = "Convert a Netlist AST to VHDL";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."netlist" or (buildDepError "netlist"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }