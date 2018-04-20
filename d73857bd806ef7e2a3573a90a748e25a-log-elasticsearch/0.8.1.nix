{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "log-elasticsearch";
          version = "0.8.1";
        };
        license = "BSD-3-Clause";
        copyright = "Scrive AB";
        maintainer = "Andrzej Rybczak <andrzej@rybczak.net>,\nJonathan Jouty <jonathan@scrive.com>,\nMikhail Glushenkov <mikhail@scrive.com>,\nOleg Grenrus <oleg.grenrus@iki.fi>";
        author = "Scrive AB";
        homepage = "https://github.com/scrive/log";
        url = "";
        synopsis = "Structured logging solution (Elasticsearch back end)";
        description = "Elasticsearch back end for the 'log' library.\nDepends on 'log-base'.";
        buildType = "Simple";
      };
      components = {
        log-elasticsearch = {
          depends  = [
            hsPkgs.base
            hsPkgs.log-base
            hsPkgs.aeson
            hsPkgs.aeson-pretty
            hsPkgs.bytestring
            hsPkgs.base64-bytestring
            hsPkgs.bloodhound
            hsPkgs.deepseq
            hsPkgs.http-client
            hsPkgs.http-client-tls
            hsPkgs.semigroups
            hsPkgs.text
            hsPkgs.text-show
            hsPkgs.time
            hsPkgs.transformers
            hsPkgs.unordered-containers
            hsPkgs.vector
          ];
        };
      };
    }