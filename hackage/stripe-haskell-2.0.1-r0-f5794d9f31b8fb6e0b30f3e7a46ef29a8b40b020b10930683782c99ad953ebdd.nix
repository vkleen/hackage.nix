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
      specVersion = "1.10";
      identifier = { name = "stripe-haskell"; version = "2.0.1"; };
      license = "MIT";
      copyright = "Copyright (c) 2016 David M. Johnson, Jeremy Shaw";
      maintainer = "djohnson.m@gmail.com";
      author = "David Johnson, Jeremy Shaw";
      homepage = "https://github.com/dmjio/stripe";
      url = "";
      synopsis = "Stripe API for Haskell";
      description = "\n<<https://stripe.com/img/navigation/logo@2x.png>>\n\n[Stripe API Coverage - <https://stripe.com/docs/api>]\nAll Stripe commands are supported,\nincluding but not limited to Charges, Refunds, Customers, Cards,\nSubscriptions, Plans, Coupons, Discounts, Invoices, Invoice Items, Bitcoin,\nDisputes, Transfers, Recipients, Application Fees, Application Fee Refunds,\nAccount, Balance, Events and Tokens.\n\n[Hspec Tests] Thoroughly unit-tested with hspec.\nAll API commands are unit-tested before inclusion into the API (see the stripe-tests package).\nTo run the tests, perform the following:\n\n>  cabal clean && cabal configure --enable-tests && cabal build tests && dist/build/tests/tests -- You will be prompted to enter your *TEST* key\n\n[Pagination - <https://stripe.com/docs/api#pagination>]\nPagination is possible on all API calls that return a JSON array.\nAny API call that returns a `StripeList` is eligible for pagination.\nTo use in practice do the following:\n\n>\n> import Web.Stripe\n> import Web.Stripe.Customer\n>\n> main :: IO ()\n> main = do\n>   let config = StripeConfig (StripeKey \"secret key\")\n>   result <- stripe config \$ getCustomers\n>                               -&- (Limit 30) -- Defaults to 10 if Nothing, 100 is Max\n>                               -&- (StartingAfter \$ CustomerId \"customer_id0\")\n>                               -&- (EndingBefore \$ CustomerId \"customer_id30\")\n>   case result of\n>     Right stripelist -> print (list stripelist :: [Customer])\n>     Left stripeError -> print stripeError\n>\n[Versioning - <https://stripe.com/docs/api#versioning>]\nAll versioning is hard-coded (for safety).\nStripe API versions specified in the HTTP headers of Stripe requests take precedence\nover the API version specified in your Stripe Dashboard (with the `Events` being an excpetion). In an attempt to ensure\nAPI consistency and correct parsing of returned JSON, all Stripe versions are hard-coded into the request, and are\ninaccessible to the end-users of this library. When a new Stripe API version is released\nthis library will increment the hard-coded API version.\n\n[Expansion - <https://stripe.com/docs/api#expansion>] Object expansion is supported on Stripe objects eligible for expansion though the `ExpandParams` type.\nObject expansion allows normal Stripe API calls to return expanded objects inside of other objects.\nFor example, a `Customer` object contains a Card ID hash on the default_card field.\nThis default_card hash can be expanded into a full `Card` object inside a `Customer` object.\nAs an example:\n\n> import Web.Stripe\n> import Web.Stripe.Customer\n>\n> main :: IO ()\n> main = do\n>   let config = StripeConfig (StripeKey \"secret key\")\n>   result <- stripe config \$ getCustomerExpandable\n>                                  (CustomerId \"customerid\")\n>                                  -&- ExpandParams [\"default_card\"]\n>   case result of\n>     Right customer   -> print (defaultCard customer) -- Will be an `Expanded` `Card`\n>     Left stripeError -> print stripeError\n>\n[MetaData - <https://stripe.com/docs/api#metadata>]\nStripe objects allow the embedding of arbitrary metadata.\nAny Stripe object that supports the embedding of metadata is available via this API.\nAs an example:\n\n> import Web.Stripe\n> import Web.Stripe.Coupon\n>\n> main :: IO ()\n> main = do\n>   let config = StripeConfig (StripeKey \"secret key\")\n>   result <- stripe config \$ updateCoupon (CouponId \"couponid\")\n>                              -&- MetaData [(\"key1\", \"value2\"), (\"key2\", \"value2\")]\n>   case result of\n>     Right coupon     -> print \$ couponMetaData coupon\n>     Left stripeError -> print stripeError\n\n[Issues - <https://github.com/dmjio/stripe-haskell/issues>]\nAny API recommendations or bugs can be reported on the GitHub issue tracker.\nPull requests welcome!\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."stripe-core" or (buildDepError "stripe-core"))
          (hsPkgs."stripe-http-streams" or (buildDepError "stripe-http-streams"))
          ];
        buildable = true;
        };
      };
    }