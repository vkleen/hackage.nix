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
      identifier = { name = "streaming"; version = "0.1.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "what_is_it_to_do_anything@yahoo.com";
      author = "michaelt";
      homepage = "https://github.com/michaelt/streaming";
      url = "";
      synopsis = "an elementary streaming prelude and a general stream type.";
      description = "@Streaming.Prelude@ exports an elementary streaming prelude relating to\nan elementary source\\/generator\\/producer type, @Stream (Of a) m r@.\n@Streaming@ exports a much more general type, @Stream f m r@, which\ncan be used to 'stream' successive distinct steps characterized by any\nfunctor @f@, though we are here interested only in a limited range of\ncases.\n\nThe streaming-io libraries have various devices for dealing\nwith effectful variants of @[a]@ or @([a],r)@. But it is only with\nthe general type @Stream f m r@, or some equivalent,\nthat one can hope to stream streams, as one makes lists of\nlists in the Haskell @Prelude@ and @Data.List@. Once one sees\nthe necessity of some such type if we are to\nexpress a properly streaming equivalent of e.g.\n\n> groups :: Ord a => [a] -> [[a]]\n> chunksOf :: Int -> [a] -> [[a]]\n\nand the like, then one will also see that, with it,\none is already in possession of a complete\nelementary streaming library. The present @Streaming.Prelude@ is the\nsimplest streaming library that can replicate anything like the\nAPI of the @Prelude@ and @Data.List@.\n\nThe emphasis of the library is on interoperation; for\nthe rest its advantages are: extreme simplicity and re-use of\nintuitions the user has gathered from mastery of @Prelude@ and\n@Data.List@. The two conceptual pre-requisites are some\ncomprehension of monad transformers and some familiarity\nwith \\'rank 2 types\\'.\n\nSee the\n<https://hackage.haskell.org/package/streaming#readme readme> below\nfor an explanation, including the examples linked there. Elementary usage can be divined from the ghci examples in\n@Streaming.Prelude@ and perhaps from this rough beginning of a\n<https://github.com/michaelt/streaming-tutorial/blob/master/tutorial.md tutorial> Note also the\n<https://hackage.haskell.org/package/streaming-bytestring streaming bytestring>\nand\n<https://hackage.haskell.org/package/streaming-utils streaming utils>\npackages.\n\nThe simplest form of interoperation with <http://hackage.haskell.org/package/pipes pipes>\nis accomplished with this isomorphism:\n\n> Pipes.unfoldr Streaming.next        :: Stream (Of a) m r   -> Producer a m r\n> Streaming.unfoldr Pipes.next        :: Producer a m r      -> Stream (Of a) m r\n\nInteroperation with <http://hackage.haskell.org/package/io-streams io-streams> is thus:\n\n> Streaming.reread IOStreams.read     :: InputStream a       -> Stream (Of a) IO ()\n> IOStreams.unfoldM Streaming.uncons  :: Stream (Of a) IO () -> IO (InputStream a)\n\nA simple exit to <http://hackage.haskell.org/package/conduit conduit> would be, e.g.:\n\n> Conduit.unfoldM Streaming.uncons    :: Stream (Of a) m ()  -> Source m a\n\nThese conversions should never be more expensive than a single @>->@ or @=\$=@. Further\npoints of comparison are discussed in the\n<https://hackage.haskell.org/package/streaming#readme readme>\nbelow.\n\nHere are the results of some\n<https://gist.github.com/michaelt/f19bef01423b17f29ffd microbenchmarks>\nbased on the\n<https://github.com/ekmett/machines/blob/master/benchmarks/Benchmarks.hs benchmarks>\nincluded in the machines package:\n\n<<http://i.imgur.com/sSG5MvH.png>>\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      };
    }