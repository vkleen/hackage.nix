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
      specVersion = "2.4";
      identifier = { name = "gitlab-haskell"; version = "0.1.5"; };
      license = "BSD-3-Clause";
      copyright = "2019 Rob Stewart, Heriot-Watt University";
      maintainer = "robstewart57@gmail.com";
      author = "Rob Stewart";
      homepage = "https://gitlab.com/robstewart57/gitlab-haskell";
      url = "";
      synopsis = "A Haskell library for the GitLab web API";
      description = "This Haskell library queries and updates the database of a GitLab instance using the GitLab web API: <https://docs.gitlab.com/ee/api/>\n\nRun all GitLab actions with `runGitLab`:\n\n> runGitLab :: (MonadUnliftIO m, MonadIO m)\n>  => GitLabServerConfig -- ^ the GitLab server details\n>  -> GitLab m a         -- ^ the GitLab action\n>  -> m a\n\nFor example:\n\n> myTodos <- runGitLab\n>      (defaultGitLabServer\n>          { url = \"https://gitlab.example.com\"\n>          , token=\"my_token\"} )\n>      todos\n\nWhich uses the `todos` function:\n\n> todos :: MonadIO m => GitLab m [Todo]\n\nUnsurprisingly, this library is maintained on GitLab: <https://gitlab.com/robstewart57/gitlab-haskell>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."connection" or (buildDepError "connection"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unliftio" or (buildDepError "unliftio"))
          (hsPkgs."unliftio-core" or (buildDepError "unliftio-core"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      };
    }