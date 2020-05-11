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
    flags = {
      experimental = false;
      bench-all = false;
      minimal-deps = false;
      bounds-check = false;
      doctest = false;
      linktest = false;
      };
    package = {
      specVersion = "1.18";
      identifier = { name = "foundation"; version = "0.0.21"; };
      license = "BSD-3-Clause";
      copyright = "2015-2017 Vincent Hanquez <vincent@snarc.org>, 2017- Foundation Maintainers";
      maintainer = "vincent@snarc.org";
      author = "Vincent Hanquez <vincent@snarc.org>";
      homepage = "https://github.com/haskell-foundation/foundation";
      url = "";
      synopsis = "Alternative prelude with batteries and no dependencies";
      description = "A custom prelude with no dependencies apart from base.\n\nThis package has the following goals:\n\n* provide a base like sets of modules that provide a consistent set of features and bugfixes across multiple versions of GHC (unlike base).\n\n* provide a better and more efficient prelude than base's prelude.\n\n* be self-sufficient: no external dependencies apart from base.\n\n* provide better data-types: packed unicode string by default, arrays.\n\n* Better numerical classes that better represent mathematical thing (No more all-in-one Num).\n\n* Better I/O system with less Lazy IO\n\n* Usual partial functions distinguished through type system";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."basement" or (buildDepError "basement"))
          ] ++ (if compiler.isGhc && (compiler.version).lt "8.0"
          then [ (hsPkgs."base" or (buildDepError "base")) ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            ] ++ (pkgs.lib).optional (system.isWindows) (hsPkgs."Win32" or (buildDepError "Win32")));
        buildable = true;
        };
      tests = {
        "check-foundation" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."basement" or (buildDepError "basement"))
            (hsPkgs."foundation" or (buildDepError "foundation"))
            ];
          buildable = true;
          };
        "foundation-link" = {
          depends = (pkgs.lib).optionals (flags.linktest) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."foundation" or (buildDepError "foundation"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            ];
          buildable = if flags.linktest then true else false;
          };
        "doctest" = {
          depends = (pkgs.lib).optionals (!flags.minimal-deps) ((pkgs.lib).optionals (flags.doctest) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ]);
          buildable = if flags.minimal-deps
            then false
            else if flags.doctest then true else false;
          };
        };
      benchmarks = {
        "bench" = {
          depends = (pkgs.lib).optionals (!(flags.minimal-deps || compiler.isGhc && (compiler.version).lt "7.10")) ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gauge" or (buildDepError "gauge"))
            (hsPkgs."basement" or (buildDepError "basement"))
            (hsPkgs."foundation" or (buildDepError "foundation"))
            ] ++ (pkgs.lib).optionals (flags.bench-all) [
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ]);
          buildable = if flags.minimal-deps || compiler.isGhc && (compiler.version).lt "7.10"
            then false
            else true;
          };
        };
      };
    }