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
      identifier = { name = "bitspeak"; version = "0.0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Maurício C. Antunes <mauricio.antunes@gmail.com>";
      author = "Maurício C. Antunes";
      homepage = "http://bitbucket.org/mauricio/bitspeak";
      url = "";
      synopsis = "Writing helper for those with Stephen Hawking like impairment.";
      description = "This is a proof-of-concept application for exercising writing\nusing binary choices, i.e., selecting from two sets of\nconsecutive letters. This is tiresome, but for those suffering\nfrom motor neuron diseases (specially one like amyotrophic\nlateral sclerosis, where cognitive functions remain intact) even\nthis small program can already be used to comunicate with the\nhelp of an assistant.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "bitspeak" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bindings-DSL" or (buildDepError "bindings-DSL"))
            (hsPkgs."bindings-glib" or (buildDepError "bindings-glib"))
            (hsPkgs."bindings-gobject" or (buildDepError "bindings-gobject"))
            ];
          pkgconfig = [
            (pkgconfPkgs."gdk-2.0" or (pkgConfDepError "gdk-2.0"))
            (pkgconfPkgs."gtk+-2.0" or (pkgConfDepError "gtk+-2.0"))
            (pkgconfPkgs."pango" or (pkgConfDepError "pango"))
            ];
          buildable = true;
          };
        };
      };
    }