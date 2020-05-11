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
      specVersion = "1.8";
      identifier = { name = "haskades"; version = "0.2.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "© 2012-2013 Stephen Paul Weber";
      maintainer = "Stephen Paul Weber <singpolyma@singpolyma.net>";
      author = "Stephen Paul Weber <singpolyma@singpolyma.net>";
      homepage = "http://github.com/singpolyma/haskades";
      url = "";
      synopsis = "Utility to generate bindings for BlackBerry Cascades";
      description = "Autogeneration of bindings for creating BlackBerry Cascades apps\nwith Haskell back ends.\n\nRun as:\n\n> ./haskades HaskadesBinding.hs haskades_run.cpp haskades_run.h < Types.hs\n\nWhere Types.hs is a Haskell file containing a a sum type declaration\nnamed 'SignalToUI' and another named 'SignalFromUI'  which fully\nspecify the communication possible between the UI layer (which you\nwrite in QML) and the Haskell backend.  QML code can access these\nsignals on the 'app' context object.  Haskell code can emit\nsignals by using the 'emit' function exported from the generated\nHaskadesBinding.  The 'emit' call is threadsafe.\n\nText, Lazy Text, and String all end up as QString so that QML can\nwork with them properly, and vice-versa.  UTCTime becomes QDateTime.\nInt, Double, and () are passed through fairly directly.  Other types\nmay have support added as there is need.\n\nA simple example lives at <https://github.com/singpolyma/haskades-sample>";
      buildType = "Simple";
      };
    components = {
      exes = {
        "haskades" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."errors" or (buildDepError "errors"))
            (hsPkgs."haskell-src" or (buildDepError "haskell-src"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."text-format" or (buildDepError "text-format"))
            ];
          buildable = true;
          };
        };
      };
    }