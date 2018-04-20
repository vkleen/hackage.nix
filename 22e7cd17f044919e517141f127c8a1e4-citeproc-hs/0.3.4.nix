{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      small_base = true;
      bibutils = true;
      network = true;
      embed_data_files = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "citeproc-hs";
          version = "0.3.4";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "andrea.rossato@unitn.it";
        author = "Andrea Rossato";
        homepage = "http://gorgias.mine.nu/repos/citeproc-hs/";
        url = "";
        synopsis = "A Citation Style Language implementation in Haskell";
        description = "citeproc-hs is a library for rendering\nbibliographic reference citations into a variety\nof styles using a macro language called Citation\nStyle Language (CSL). More details on CSL can be\nfound here:\n<http://citationstyles.org/>.\n\nFor the API documentation please see \"Text.CSL\".";
        buildType = "Simple";
      };
      components = {
        citeproc-hs = {
          depends  = ((([
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.mtl
            hsPkgs.xml
            hsPkgs.json
            hsPkgs.utf8-string
            hsPkgs.bytestring
            hsPkgs.filepath
            hsPkgs.pandoc-types
          ] ++ pkgs.lib.optional _flags.bibutils hsPkgs.hs-bibutils) ++ pkgs.lib.optionals _flags.network [
            hsPkgs.network
            hsPkgs.HTTP
          ]) ++ pkgs.lib.optionals _flags.embed_data_files [
            hsPkgs.template-haskell
            hsPkgs.file-embed
          ]) ++ (if compiler.isGhc
            then [
              hsPkgs.base
              hsPkgs.syb
              hsPkgs.parsec
              hsPkgs.old-locale
              hsPkgs.time
            ]
            else [ hsPkgs.base ]);
        };
      };
    }