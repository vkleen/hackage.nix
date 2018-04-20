{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      network-uri = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "hxt-relaxng";
          version = "9.1.5.1";
        };
        license = "MIT";
        copyright = "Copyright (c) 2005-2011 Uwe Schmidt";
        maintainer = "Uwe Schmidt <uwe@fh-wedel.de>";
        author = "Uwe Schmidt, Martin Schmidt, Torben Kuseler";
        homepage = "http://www.fh-wedel.de/~si/HXmlToolbox/index.html";
        url = "";
        synopsis = "The HXT RelaxNG validator";
        description = "The HXT RelaxNG validator";
        buildType = "Simple";
      };
      components = {
        hxt-relaxng = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.parsec
            hsPkgs.hxt
            hsPkgs.hxt-charproperties
            hsPkgs.hxt-regex-xmlschema
          ] ++ (if _flags.network-uri
            then [ hsPkgs.network-uri ]
            else [ hsPkgs.network ]);
        };
      };
    }