{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      halvm = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "entropy";
          version = "0.3.8";
        };
        license = "BSD-3-Clause";
        copyright = "Thomas DuBuisson <thomas.dubuisson@gmail.com>";
        maintainer = "Thomas DuBuisson <thomas.dubuisson@gmail.com>";
        author = "Thomas DuBuisson <thomas.dubuisson@gmail.com>";
        homepage = "https://github.com/TomMD/entropy";
        url = "";
        synopsis = "A platform independent entropy source";
        description = "A platform independent method to obtain cryptographically strong entropy\n(RDRAND when available anywhere, urandom on nix, CryptAPI on Windows, patches welcome)\nUsers looking for cryptographically strong (number-theoretically\nsound) PRNGs should see the 'DRBG' package too.";
        buildType = "Custom";
      };
      components = {
        entropy = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
          ] ++ pkgs.lib.optional (!system.isWindows && !system.isHalvm) hsPkgs.unix;
          libs = pkgs.lib.optional system.isWindows pkgs.advapi32;
        };
      };
    }