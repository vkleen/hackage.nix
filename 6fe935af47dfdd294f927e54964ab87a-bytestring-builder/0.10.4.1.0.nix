{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      bytestring_has_builder = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "bytestring-builder";
          version = "0.10.4.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2010 Jasper Van der Jeugt\n(c) 2010-2013 Simon Meier";
        maintainer = "Leon P Smith <leon@melding-monads.com>";
        author = "Simon Meier, Jasper Van der Jeugt";
        homepage = "";
        url = "";
        synopsis = "The new bytestring builder, packaged outside of GHC";
        description = "This is the bytestring builder that is debuting in bytestring-0.10.4.0, which\nshould be shipping with GHC 7.8, probably late in 2013.  This builder has\nseveral nice simplifications and improvements, and more out-of-box\nfunctionality than the older blaze-builder.\n\nNote that this package detects which version of bytestring you are compiling\nagainst,  and if you are compiling against bytestring-0.10.4 or later, will\nbe an empty package.\n\nThis package lets the new interface and implementation be used with most\nolder compilers without upgrading bytestring, which can be rather\nproblematic.  In conjunction with blaze-builder-0.4 or later,  which\noffers an implementation of blaze-builder in terms of bytestring-builder,\nthis should let most people try the new interface and implementation without\ncausing undue compatibility problems with packages that depend on\nblaze-builder.\n\nGHC 7.6 did debut an almost identical interface and implementation, but with\nslightly different module names and organization.   Trying to re-export/rename\nthe builder provided with 7.6 did not turn out to be very practical,  because\nthis interface includes new functions that rely on Builder internals,\nwhich are not exported in 7.6.  Furthermore, these module names should be\ndeprecated in 7.10.";
        buildType = "Simple";
      };
      components = {
        bytestring-builder = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.deepseq
          ] ++ [ hsPkgs.bytestring ];
        };
      };
    }