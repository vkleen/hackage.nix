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
    flags = {};
    package = {
      specVersion = "1.8";
      identifier = { name = "binary-file"; version = "0.12.8"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Yoshikuni Jujo <PAF01143@nifty.ne.jp>";
      author = "Yoshikuni Jujo <PAF01143@nifty.ne.jp>";
      homepage = "";
      url = "";
      synopsis = "read/write binary file";
      description = "> runghc -XQuasiQuotes exam.hs some.bmp out.bmp\n\nexam.hs:\n\n> import File.Binary\n> import File.Binary.Data.LittleEndian\n> import System.Environment\n> import Data.ByteString as BS\n>\n> main = do\n>\t[inf, outf] <- getArgs\n>\n>   cnt <- BS.readFile inf\n>\tlet bmp = readBitmap \$ cnt `BS.append` replicate 20 ' '\n>\tprint bmp\n>\n>\tlet out = writeBitmap bmp {\n>\t\tauthorFirst = \"Yoshikuni \",\n>\t\tauthorSecond = \"Jujo      \"\n>\t }\n>   BS.writeFile outf out\n>\n> instance RetType (Int, Int, Int) where\n>    type Argument (Int, Int, Int) = ()\n>    fromType _ (b, g, r) = cc \$ [\n>        fromType 1 b, fromType 1 g, fromType 1 r, zero]\n>    toType _ str = let\n>        (b, rest) = toType 1 str\n>        (g, rest') = toType 1 rest\n>        (r, rest'') = toType 1 rest' in\n>        ((b, g, r), dp 1 rest'')\n>\n> [binary|\n>\n> Bitmap\n>\n> 2: \"BM\"\n> 4: fileSize\n> 2: 0\n> 2: 0\n> 4: offset\n>\n> 4: 40\n> 4: bitmapWidth\n> 4: bitmapHeight\n> 2: 1\n> 2: bitsPerPixel\n> 4: compressionMethod\n> 4: imageSize\n> 4: horizontalResolution\n> 4: verticalResolution\n> 4: numberOfColors\n> 4: importantColors\n> ((), Just numberOfColors)<[(Int, Int, Int)]>: colors\n> imageSize<BS.ByteString>: image\n>\n> ((), Just 10)<String>: authorFirst\n> ((), Just 10)<String>: authorSecond\n>\n> |]\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."peggy" or (buildDepError "peggy"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        buildable = true;
        };
      };
    }