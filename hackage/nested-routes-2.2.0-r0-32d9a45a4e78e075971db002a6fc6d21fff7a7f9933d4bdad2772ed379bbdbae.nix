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
      identifier = { name = "nested-routes"; version = "2.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Athan Clark <athan.clark@gmail.com>";
      author = "Athan Clark <athan.clark@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Declarative, compositional Wai responses";
      description = "A method to writing Wai responses\n\nThis library attempts to make it easier to write nice Wai response handlers\nby giving us a Sinatra/\n<https://hackage.haskell.org/package/scotty Scotty>-like syntax for declaring HTTP-verb oriented\nroutes, in addition to file-extension handling and rose-tree like composition.\nNot only do we have literal route specification, like\n<https://hackage.haskell.org/package/scotty Scotty> &\n<https://hackage.haskell.org/package/spock Spock>, but we\ncan also embed\n<https://hackage.haskell.org/package/attoparsec Attoparsec>\nparsers and <https://hackage.haskell.org/package/regex-compat Regular Expressions>\n/directly/ in our routes, with our handlers\nreflecting their results. You can find more information on the <https://www.fpcomplete.com/user/AthanClark/nested-routes demo>.\n\nAs an example:\n\n> router :: Application\n> router = route handlers\n>   where\n>     handlers = do\n>       handle o\n>         (Just \$ get \$ text \"home\")\n>         Nothing\n>       handle (\"foo\" </> \"bar\")\n>         (Just \$ get \$ text \"foobar\") \$ Just \$\n>         handle (p (\"baz\", double) </> o)\n>           (Just \$ \\d -> get \$ text \$ LT.pack (show d) <> \" bazs\")\n>           Nothing\n>       handle (p (\"num\",double) </> o)\n>         (Just \$ \\d -> get \$ text \$ LT.pack \$ show d) \$ Just \$ do\n>         handle \"bar\"\n>            (Just \$ \\d -> get \$ do\n>                     text \$ (LT.pack \$ show d) <> \" bars\")\n>                     json \$ (LT.pack \$ show d) <> \" bars!\")\n>            Nothing\n>         handle (r (\"email\", mkRegex \"(^[-a-zA-Z0-9_.]+@[-a-zA-Z0-9]+\\\\.[-a-zA-Z0-9.]+\$)\") </> o)\n>            (Just \$ \\d e -> get \$ textOnly \$ (LT.pack \$ show d) <> \" \" <> (LT.pack \$ show e)\n\nThe route specification syntax is a little strange right now - @l@ specifies\na \"literal chunk\" of a handlable url (ie - @l \\\"foo\\\" \\<\\/\\> l \\\"bar\\\" \\<\\/\\> o@ would\nrepresent the url @\\/foo\\/bar@), while @p@ represents a \"parsable\" url chunk,\nwhich expects a pair - the left element being merely a reference name for the\nparser during internal plumbing, and the right being the actual @Parser@. @o@ represents\nthe end of a url string, and can be used alone in a handler to capture requests\nto the root path.\n\nEach route being handled needs some kind of content. For every parsed url chunk,\nthe route expects a function\nof arity matching 1-for-1 with the parsed contents. For example, @\\d -> ...@ in the\ndemonstration above is such a function, where @d :: Double@.\n\nInternally, we match against both the file extension and Accept headers in the\nHTTP request - the Accept header may override the file extension.\n\nWhen we test our application:\n\n>  λ> curl localhost:3000/ -H \"Accept: text/plain, */*\"\n>  ↪ \"home\"\n\nrequests may end with index\n\n>  λ> curl localhost:3000/index -H \"Accept: text/plain, */*\"\n>  ↪ \"home\"\n\nand specify the file extension\n\n>  λ> curl localhost:3000/index.txt -H \"Accept: text/plain, */*\"\n>  ↪ \"home\"\n\neach responding with the \"closest\" available file type\n\n>  λ> curl localhost:3000/index.html -H \"Accept: text/html, */*\"\n>  ↪ \"home\"\n\n>  λ> curl localhost:3000/foo/bar -H \"Accept: text/plain, */*\"\n>  ↪ \"foobar\"\n\n>  λ> curl localhost:3000/foo/bar.txt -H \"Accept: text/plain, */*\"\n>  ↪ \"foobar\"\n\n>  λ> curl localhost:3000/foo/bar/5678.5678 -H \"Accept: text/plain, */*\"\n>  ↪ \"5678.5678 bazs\"\n\n>  λ> curl localhost:3000/1234.1234 -H \"Accept: text/plain, */*\"\n>  ↪ \"1234.1234\"\n\n>  λ> curl localhost:3000/2e5 -H \"Accept: text/plain, */*\"\n>  ↪ \"200000.0\"\n\n>  λ> curl localhost:3000/1234.1234/bar -H \"Accept: text/plain, */*\"\n>  ↪ \"1234.1234 bars\"";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."wai-util" or (buildDepError "wai-util"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."http-media" or (buildDepError "http-media"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."witherable" or (buildDepError "witherable"))
          (hsPkgs."composition" or (buildDepError "composition"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."constraints" or (buildDepError "constraints"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."lucid" or (buildDepError "lucid"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."clay" or (buildDepError "clay"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."pred-trie" or (buildDepError "pred-trie"))
          (hsPkgs."poly-arity" or (buildDepError "poly-arity"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-wai" or (buildDepError "hspec-wai"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."lucid" or (buildDepError "lucid"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."composition" or (buildDepError "composition"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."wai-util" or (buildDepError "wai-util"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."poly-arity" or (buildDepError "poly-arity"))
            (hsPkgs."witherable" or (buildDepError "witherable"))
            (hsPkgs."constraints" or (buildDepError "constraints"))
            (hsPkgs."pred-trie" or (buildDepError "pred-trie"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."http-media" or (buildDepError "http-media"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            ];
          buildable = true;
          };
        };
      };
    }