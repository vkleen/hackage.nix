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
      identifier = { name = "spoty"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nilsson.dd+code@gmail.com";
      author = "David Nilsson";
      homepage = "https://github.com/davnils/spoty";
      url = "";
      synopsis = "Spotify web API wrapper";
      description = "Web API <https://developer.spotify.com/web-api/> wrapper powered by lens and pipes, allowing easy access to public endpoints.\nDoes not have any external dependencies nor requirements regarding app registration.\n\n* Paging is handled transparently using pipes\n\n* All data types are navigated using lenses\n\nAll public endpoints, with multi-get versions excluded, are implemented.\n\n> > :set -XOverloadedStrings\n> > :m +Control.Lens Utils.Spoty\n> > Just artist <- fetchOne (searchArtist \"avicii\")      -- assume at least one match\n> > popular <- getArtistTop (view spotifyID artist) \"SE\" -- retrieve the most popular tracks in Sweden\n> > mapM_ (print . view name) popular                    -- print the corresponding names\n> \"Hey Brother\"\n> \"Addicted To You\"\n> \"Wake Me Up\"\n> ...\n\nPlease read the README for details.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."wreq" or (buildDepError "wreq"))
          ];
        buildable = true;
        };
      };
    }