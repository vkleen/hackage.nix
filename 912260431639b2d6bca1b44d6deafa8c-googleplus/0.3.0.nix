{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "googleplus";
          version = "0.3.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Michael Xavier <michael@michaelxavier.net>";
        author = "Michael Xavier <michael@michaelxavier.net>";
        homepage = "http://github.com/michaelxavier/GooglePlus";
        url = "";
        synopsis = "Haskell implementation of the Google+ API v1";
        description = "Will implement the Google+ REST API. Google+ is a social network made by\nGoogle. Found out more at <http://plus.google.com>.\nImplements the full API as of Oct 15, 2011. Only features read-only API\naccess beacuse that is all that Google has published thus far. Both API and\nOAuth authentication is supported, but note that if you intend to use OAuth,\nthis library does not currently provide the means to procure and renew OAuth\ntokens.";
        buildType = "Simple";
      };
      components = {
        googleplus = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.attoparsec
            hsPkgs.containers
            hsPkgs.bytestring
            hsPkgs.enumerator
            hsPkgs.haskell98
            hsPkgs.http-enumerator
            hsPkgs.http-types
            hsPkgs.mtl
            hsPkgs.rfc3339
            hsPkgs.text
            hsPkgs.time
            hsPkgs.transformers
            hsPkgs.url
          ];
        };
      };
    }