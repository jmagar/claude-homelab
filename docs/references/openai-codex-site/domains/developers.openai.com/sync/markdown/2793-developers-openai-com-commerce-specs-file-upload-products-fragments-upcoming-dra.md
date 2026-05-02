## Feed Reference
To make your products discoverable inside ChatGPT, merchants provide a
structured product feed file that OpenAI ingests and indexes. This
specification defines the product schema for file uploads: field names, data
types, constraints, and example values needed for accurate discovery,
pricing, availability, and seller context.
Each table below groups fields by schema object and indicates whether a
field is Required or Optional, along with validation rules to help your
engineering team build and maintain a compliant upload file.
Supplying all required fields ensures your products can be displayed
correctly, while optional fields enrich relevance and user trust.
Field scope
All fields
(0)
Required fields only
(0)
View
### Header
A header file with feed metdata should be provided.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`feed\_id`|`string`|—|Identifier for the feed.|`feed\_8f3K2x`|Required|—|—|
|`account\_id`|`string`|—|Identifier for the account.|`acct\_7F3K2x`|Required|—|—|
|`target\_merchant`|`string`|—|Identifier for the target merchant.|`merch\_123`|Required|—|—|
|`target\_country`|`string`|ISO 3166-1 alpha-2 country code|Two-letter target country code.|`US`|Required|—|Must be a valid two-letter country code.|
### Product
Every line in the feed file should be a product object, which defines the canonical product record and its variant set.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`id`|`string`|—|Stable global identifier for this product.|`SKU12345`|Required|—|Must remain stable over time.|
|`title`|`string`|—|Product title.|`Trail Running Shoe`|Optional|—|—|
|`description`|`Description`|—|Product description content.|`{ "plain": "Waterproof trail shoe with cushioned sole." }`|Optional|—|Must match the `Description` object.|
|`url`|`string (uri)`|URI|Canonical product URL.|`https://example.com/products/SKU12345`|Optional|—|Must be a valid URI.|
|`media`|`Media[]`|—|Product-level media assets.|`[{ "type": "image", "url": "https://example.com/images/SKU12345.jpg" }]`|Optional|—|Each item must match `Media`.|
|`variants`|`Variant[]`|—|Variants associated with the product.|`[{ "id": "SKU12345-BLK-10", "title": "Black / 10" }]`|Required|—|Each item must match `Variant`.|
### Variant
Use variants to represent purchasable product configurations such as color or size.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`id`|`string`|—|Stable global identifier for this variant.|`SKU12345-BLK-10`|Required|—|Must remain stable over time.|
|`title`|`string`|—|Variant title.|`Black / 10`|Required|—|—|
|`description`|`Description`|—|Variant description content.|`{ "plain": "Black colorway in size 10." }`|Optional|—|Must match the `Description` object.|
|`url`|`string (uri)`|URI|Variant URL.|`https://example.com/products/SKU12345-BLK-10`|Optional|—|Must be a valid URI.|
|`barcodes`|`Barcode[]`|—|Variant barcode values.|`[{ "type": "gtin", "value": "1234567890123" }]`|Optional|—|Each item must match `Barcode`.|
|`price`|`Price`|—|Active sale price for this variant.|`{ "amount": 7999, "currency": "USD" }`|Optional|—|Must match the `Price` object.|
|`list\_price`|`Price`|—|Reference price before any discount is applied.|`{ "amount": 9999, "currency": "USD" }`|Optional|—|Must match the `Price` object.|
|`unit\_price`|`UnitPrice`|—|Unit pricing metadata.|`{ "amount": 499, "currency": "USD", "measure": { "value": 1, "unit": "oz" }, "reference": { "value": 1, "unit": "oz" } }`|Optional|—|Must match the `UnitPrice` object.|
|`availability`|`Availability`|—|Availability state for the variant.|`{ "available": true, "status": "in\_stock" }`|Optional|—|Must match the `Availability` object.|
|`categories`|`Category[]`|—|Categories associated with the variant.|`[{ "value": "Apparel & Accessories \> Shoes", "taxonomy": "merchant" }]`|Optional|—|Each item must match `Category`.|
|`condition`|`Condition`|Array of strings, such as `new` or `secondhand`|Applicable item conditions.|`["new"]`|Optional|—|More than one value may apply.|
|`variant\_options`|`VariantOption[]`|—|Set of option selections for the variant, such as color or size.|`[{ "name": "color", "value": "Black" }, { "name": "size", "value": "10" }]`|Optional|—|Each item must match `VariantOption`.|
|`media`|`Media[]`|—|Variant media assets. The first entry is treated as primary.|`[{ "type": "image", "url": "https://example.com/images/SKU12345-BLK-10.jpg" }]`|Optional|—|Each item must match `Media`.|
|`seller`|`Seller`|—|Seller metadata for the variant.|`{ "name": "Example Store" }`|Optional|—|Must match the `Seller` object.|
### Description
Use the description object to supply plain text, HTML, Markdown, or any combination of those formats.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`plain`|`string`|—|Plain-text description.|`Waterproof trail shoe.`|Optional|—|At least one description field is required if present.|
|`html`|`string`|—|HTML description.|`\<p\>Waterproof trail shoe.\</p\>`|Optional|—|At least one description field is required if present.|
|`markdown`|`string`|—|Markdown description.|`Waterproof trail shoe.`|Optional|—|At least one description field is required if present.|
### Availability
Use availability to describe whether the variant can currently be purchased and, when available, its fulfillment state.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`available`|`boolean`|`true`, `false`|Indicates whether the variant is currently purchasable.|`true`|Optional|—|—|
|`status`|`string`|`in\_stock`, `backorder`, `preorder`, `out\_of\_stock`, `discontinued`|Fulfillment state when availability is reported.|`in\_stock`|Optional|—|—|
### Price
Use the price object anywhere a product or variant needs an amount and currency pair.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`amount`|`integer`|`0` or greater|Monetary amount expressed in ISO 4217 minor units.|`7999`|Required|—|Must be greater than or equal to `0`.|
|`currency`|`string`|ISO 4217 code|Three-letter ISO 4217 currency identifier.|`USD`|Required|—|—|
### UnitPrice
Use the unit price object to express pricing per measured quantity.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`amount`|`integer`|—|Unit price amount.|`499`|Required|—|—|
|`currency`|`string`|ISO 4217 code|Currency code.|`USD`|Required|—|—|
|`measure`|`Measure`|—|Measured quantity.|`{ "value": 1, "unit": "oz" }`|Required|—|Must match the `Measure` object.|
|`reference`|`ReferenceMeasure`|—|Reference quantity.|`{ "value": 1, "unit": "oz" }`|Required|—|Must match the `ReferenceMeasure` object.|
### Measure
Use the measure object to describe a quantity and unit.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`value`|`number`|—|Measure value.|`1`|Required|—|—|
|`unit`|`string`|—|Measure unit.|`oz`|Required|—|—|
### ReferenceMeasure
Use the reference measure object to define the baseline quantity for unit pricing.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`value`|`integer`|—|Reference value.|`1`|Required|—|—|
|`unit`|`string`|—|Reference unit.|`oz`|Required|—|—|
### Barcode
Use barcode entries to attach standardized barcode identifiers to a variant.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`type`|`string`|—|Barcode type.|`gtin`|Required|—|—|
|`value`|`string`|—|Barcode value.|`1234567890123`|Required|—|—|
### Media
Use media entries to attach product or variant assets such as images or videos.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`type`|`string`|—|Media type.|`image`|Required|—|—|
|`url`|`string (uri)`|URI|Media URL.|`https://example.com/images/SKU12345.jpg`|Required|—|Must be a valid URI.|
|`alt\_text`|`string`|—|Alternate text.|`Black trail running shoe`|Optional|—|—|
|`width`|`integer`|—|Media width.|`1200`|Optional|—|—|
|`height`|`integer`|—|Media height.|`1200`|Optional|—|—|
### VariantOption
Use variant options to capture dimensions like color, size, or material.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`name`|`string`|—|Option name, such as color or size.|`color`|Required|—|—|
|`value`|`string`|—|Selected option value.|`Black`|Required|—|—|
### Category
Use categories to represent the taxonomy path associated with a variant.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`value`|`string`|—|Category label or hierarchical path.|`Apparel & Accessories \> Shoes`|Required|—|—|
|`taxonomy`|`string`|—|Taxonomy system used for the category value, such as `google\_product\_category`, `shopify`, or `merchant`.|`merchant`|Optional|—|—|
### Seller
Use the seller object to attach seller metadata and policy links to a variant.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`name`|`string`|—|Seller name.|`Example Store`|Optional|—|—|
|`links`|`Link[]`|—|Seller-related links.|`[{ "type": "faq", "url": "https://example.com/faq" }]`|Optional|—|Each item must match `Link`.|
### Link
Use seller links to point to policies or supporting merchant pages.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`type`|`string`|`privacy\_policy`, `terms\_of\_service`, `refund\_policy`, `shipping\_policy`, `faq`|Kind of destination, such as `privacy\_policy`, `terms\_of\_service`, `refund\_policy`, `shipping\_policy`, or `faq`.|`refund\_policy`|Required|—|—|
|`title`|`string`|—|Link title.|`Returns policy`|Optional|—|—|
|`url`|`string`|—|Link destination URL.|`https://example.com/returns`|Required|—|—|
### Condition
Use the condition array to describe applicable item conditions for a variant.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|`condition`|`string[]`|Values such as `new`, `secondhand`|Applicable item conditions for the variant.|`["new"]`|Optional|—|More than one value may apply.|