{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "validity";
          version = "0.3.3.0";
        };
        license = "MIT";
        copyright = "Copyright: (c) 2016 Tom Sydney Kerckhove";
        maintainer = "syd.kerckhove@gmail.com";
        author = "Tom Sydney Kerckhove";
        homepage = "https://github.com/NorfairKing/validity#readme";
        url = "";
        synopsis = "Validity typeclass";
        description = "For more info, see <https://github.com/NorfairKing/validity the readme>.\n\nNote: There are companion instance packages for this library:\n\n* <https://hackage.haskell.org/package/validity-text validity-text>\n\n* <https://hackage.haskell.org/package/validity-path validity-path>\n\n* <https://hackage.haskell.org/package/validity-time validity-time>\n\n* <https://hackage.haskell.org/package/validity-containers validity-containers>\n\n* <https://hackage.haskell.org/package/validity-bytestring validity-bytestring>";
        buildType = "Simple";
      };
      components = {
        validity = {
          depends  = [ hsPkgs.base ];
        };
      };
    }