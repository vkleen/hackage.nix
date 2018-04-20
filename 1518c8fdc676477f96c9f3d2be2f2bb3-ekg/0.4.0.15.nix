{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "ekg";
          version = "0.4.0.15";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Johan Tibell <johan.tibell@gmail.com>,\nMikhail Glushenkov <mikhail.glushenkov@gmail.com>";
        author = "Johan Tibell";
        homepage = "https://github.com/tibbe/ekg";
        url = "";
        synopsis = "Remote monitoring of processes";
        description = "This library lets you remotely monitor a running process over HTTP.\nIt provides a simple way to integrate a monitoring server into any\napplication.";
        buildType = "Simple";
      };
      components = {
        ekg = {
          depends  = [
            hsPkgs.aeson
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.ekg-core
            hsPkgs.ekg-json
            hsPkgs.filepath
            hsPkgs.network
            hsPkgs.snap-core
            hsPkgs.snap-server
            hsPkgs.text
            hsPkgs.time
            hsPkgs.transformers
            hsPkgs.unordered-containers
          ];
        };
      };
    }