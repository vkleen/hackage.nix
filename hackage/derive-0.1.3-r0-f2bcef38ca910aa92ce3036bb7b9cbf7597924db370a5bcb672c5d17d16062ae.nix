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
    flags = { small_base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "derive"; version = "0.1.3"; };
      license = "BSD-3-Clause";
      copyright = "2006-7, Neil Mitchell";
      maintainer = "ndmitchell@gmail.com";
      author = "Neil Mitchell & Stefan O'Rear";
      homepage = "http://www-users.cs.york.ac.uk/~ndm/derive/";
      url = "";
      synopsis = "A program and library to derive instances for data types";
      description = "Data.Derive is a library and a tool for deriving instances for Haskell programs.\nIt is designed to work with custom derivations, SYB and Template Haskell mechanisms.\nThe tool requires GHC, but the generated code is portable to all compilers.\nWe see this tool as a competitor to DrIFT.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ] ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).ge "6.10") [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."syb" or (buildDepError "syb"))
          ]) ++ (if flags.small_base
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."packedstring" or (buildDepError "packedstring"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ]
          else [ (hsPkgs."base" or (buildDepError "base")) ]);
        buildable = true;
        };
      exes = { "derive" = { buildable = true; }; };
      };
    }