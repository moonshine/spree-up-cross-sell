## NOTE: This extension is no longer supported. Do not use it, please seek other alternatives

# Up/Cross Sell

This is an extension to Spree that allows you to define relationships between products
allowing product managers to define one-to-many relationships between products for marketing
purposes.

This extension offers the following sales relationships:

* Up sell: where if a potential customer is viewing a product an invitation to investigate a more
profitable product is offered.

* Cross sell: where a potential customer is offered alternatives to the product being viewed.

* Complementary products: are intended as follow-on purchase opportunities. For example when
a customer adds a swimsuit to the cart they are presented with suggestions for
beach towels, sunglasses and sunscreen.

Note: Some concepts and code used from spree-accessories, see http://github.com/BDQ/spree-accessories

## Usage

### Run migration

Run the DB migration to add a new table to store the prices for each zone and product variant.

### Setup sales relationships

A new menu item 'Up Sell/Cross Sell' has been added to the product edit page that when selected allows
the administrator to setup the required relationships between products.

### Add required code to store

This extension does not add any code to display the related products in the store as this is site specific, so
you will need to develop this yourself.

## TODO list

Tests

