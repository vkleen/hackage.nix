let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = {
      with_sound = true;
      with_hint = true;
      with_mpd = true;
      with_hlist = false;
      with_regex_posix = true;
      with_template_haskell = true;
      with_brightness = true;
      testing = false;
      };
    package = {
      specVersion = "1.2.1";
      identifier = { name = "xmonad-extras"; version = "0.14"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sibi <sibi@psibi.in>, daniel@wagner-home.com, daniel.schoepe@googlemail.com";
      author = "The Daniels Schoepe and Wagner";
      homepage = "https://github.com/xmonad/xmonad-extras";
      url = "";
      synopsis = "Third party extensions for xmonad with wacky dependencies";
      description = "Various modules for xmonad that cannot be added to xmonad-contrib\nbecause of additional dependencies.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ((((([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."X11" or (buildDepError "X11"))
          (hsPkgs."xmonad" or (buildDepError "xmonad"))
          (hsPkgs."xmonad-contrib" or (buildDepError "xmonad-contrib"))
          ] ++ (pkgs.lib).optional (flags.with_sound) (hsPkgs."alsa-mixer" or (buildDepError "alsa-mixer"))) ++ (pkgs.lib).optionals (flags.with_hint) [
          (hsPkgs."hint" or (buildDepError "hint"))
          (hsPkgs."network" or (buildDepError "network"))
          ]) ++ (pkgs.lib).optionals (flags.with_mpd) [
          (hsPkgs."libmpd" or (buildDepError "libmpd"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ]) ++ (pkgs.lib).optional (flags.with_regex_posix) (hsPkgs."regex-posix" or (buildDepError "regex-posix"))) ++ (pkgs.lib).optional (flags.with_brightness) (hsPkgs."bytestring" or (buildDepError "bytestring"))) ++ (pkgs.lib).optionals (flags.with_template_haskell && flags.with_hlist) [
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."HList" or (buildDepError "HList"))
          ];
        buildable = true;
        };
      };
    }