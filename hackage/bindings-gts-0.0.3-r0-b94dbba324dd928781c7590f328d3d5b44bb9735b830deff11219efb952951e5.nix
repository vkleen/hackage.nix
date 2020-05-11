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
      specVersion = "1.4";
      identifier = { name = "bindings-gts"; version = "0.0.3"; };
      license = "LGPL-3.0-only";
      copyright = "";
      maintainer = "Joel Crisp <joel.a.crisp@googlemail.com>";
      author = "Maurício C. Antunes (Bindings-DSL), Joel Crisp (Bindings-GTS), Stephane Popinet <s.popinet at niwa.co.nz> (GTS)";
      homepage = "http://gts.sourceforge.net/";
      url = "";
      synopsis = "Low level bindings supporting GTS, the GNU Triangulated Surface Library";
      description = "This package contains bindings to GTS library using bindings-DSL\nmacros and style. Like GObject, it's not useful by itself, but as a\nfoundation for other libraries making use of its type system.\n\nNOTE: these bindings were not made by the author(s) of GTS so please\ndon't bug them about issues with the bindings! Any errors in these\nbindings are my responsibility not that of the GTS team.\n\nNOTE: Not all functionality is covered by these bindings at this\ntime, but there should be enough to be useful.\n\nNOTE: Documentation does not build on Hackage DB (due to Hackage\nbuild hosts not having GTS on them) but can be built with\n/cabal haddock/\n\nNOTE: Some warnings are produced during compilation; these appear\nto be the result of the Bindings-GTS macros and may safely be\nignored (I hope!)\n\nChangelog:\n\n* 0.0.1 Initial version.\n\n* 0.0.2 Improved documentation; added some missing functions; fixed a function name; bumped version of base to >=4\n\n* 0.0.3 Adding missing GTS enumeration for CSG boolean operations; added some more missing functions; fixed some bad FunPtr references;\nadded some helper methods\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
          (hsPkgs."bindings-glib" or (buildDepError "bindings-glib"))
          (hsPkgs."bindings-gobject" or (buildDepError "bindings-gobject"))
          ];
        pkgconfig = [
          (pkgconfPkgs."gobject-2.0" or (pkgConfDepError "gobject-2.0"))
          (pkgconfPkgs."gthread-2.0" or (pkgConfDepError "gthread-2.0"))
          (pkgconfPkgs."gmodule-2.0" or (pkgConfDepError "gmodule-2.0"))
          (pkgconfPkgs."gts" or (pkgConfDepError "gts"))
          ];
        buildable = true;
        };
      };
    }