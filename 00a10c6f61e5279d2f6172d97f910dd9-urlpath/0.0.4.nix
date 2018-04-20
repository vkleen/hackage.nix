{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "urlpath";
          version = "0.0.4";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Athan Clark <athan.clark@gmail.com>";
        author = "Athan Clark <athan.clark@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "Painfully simple URL writing combinators";
        description = "Simple URL DSL for Haskell.\n\nUse raw combinators (kinda useless) ...\n\n>  render \$ \"foo.php\" <?> (\"key1\",\"bar\") <&> (\"key2\",\"baz\")\n>\n>  ↪ \"foo.php?key1=bar&key2=baz\"\n\n... or use the MonadReader instance for a configurable root ...\n\n>  let url = runReader \$ expandAbsolute \$ \"foo.php\" <?> (\"key1\",\"bar\") <&> (\"key2\",\"baz\")\n>  url \"example.com\"\n>\n>  ↪ \"example.com/foo.php?key1=bar&key2=baz\"\n\n... in Lucid ...\n\n>  (runReader \$ renderTextT \$\n>    (\\a -> do\n>      foo <- lift \$ expandAbsolute a\n>      script_ [src_ foo] \"\" )\n>    (\"foo\" <?> (\"bar\",\"baz\"))\n>  ) \"example.com\"\n>\n>  ↪ \"<script src=\\\"example.com/foo?bar=baz\\\"></script>\"\n\n... and in Scotty ...\n\n>  main :: IO ()\n>  main = scottyT 3000\n>      rootConf\n>      rootConf\n>      run\n>\n>    where\n>      rootConf = flip runReaderT \"http://example.com\"\n>\n>      run :: ( MonadIO m\n>             , MonadReader T.Text m ) =>\n>             ScottyT LT.Text m ()\n>      run = get \"/\" \$ do\n>        path <- lift \$ expandAbsolute \$ \"foo\" <?> (\"bar\",\"baz\")\n>        text \$ LT.fromStrict path\n>\n>  λ> curl localhost:3000/\n>  ↪ \"http://example.com/foo?bar=baz\"";
        buildType = "Simple";
      };
      components = {
        urlpath = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.text
            hsPkgs.transformers
          ];
        };
      };
    }