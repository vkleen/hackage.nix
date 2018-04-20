{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "xml-basic";
          version = "0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
        author = "Henning Thielemann <haskell@henning-thielemann.de>";
        homepage = "http://www.haskell.org/haskellwiki/XML-Basic";
        url = "";
        synopsis = "Basics for XML/HTML representation and processing";
        description = "We provide basic data types for XML representation,\nlike names, attributes, entities.\nYes we try hard to get type safe XML handling out of Haskell 98.\nWe also provide information about exceptional HTML tags,\nlike self-closing tags.\nThis package provides common functionality\nthat is both needed in list (tagsoup-ht) and tree (wraxml) representations of XML.";
        buildType = "Simple";
      };
      components = {
        xml-basic = {
          depends  = [
            hsPkgs.explicit-exception
            hsPkgs.data-accessor
            hsPkgs.utility-ht
          ] ++ (if _flags.splitbase
            then [
              hsPkgs.base
              hsPkgs.containers
            ]
            else [
              hsPkgs.base
              hsPkgs.special-functors
            ]);
        };
      };
    }