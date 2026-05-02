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
### OpenAI Flags
Use these flags to control whether a product is discoverable and or purchasable
inside ChatGPT. These fields do not affect how the product is displayed on your
own site. They simply enable or disable the ChatGPT integrations.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|is\_eligible\_search|Boolean|`true`, `false`|Controls whether the product can be surfaced in ChatGPT search results.|`true`|Required|—|Lower-case string|
|is\_eligible\_checkout|Boolean|`true`, `false`|Allows direct purchase inside ChatGPT. `is\_eligible\_search` must be `true` for `is\_eligible\_checkout` to be enabled for the product.|`true`|Required|Requires `is\_eligible\_search=true`|Lower-case string|
### Basic Product Data
Provide the core identifiers and descriptive text needed to uniquely reference
each product. These fields establish the canonical record that ChatGPT Search
uses to display and link to your product.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|item\_id|String (alphanumeric)|—|Merchant product ID (unique per variant)|`SKU12345`|Required|—|Max 100 chars; must remain stable over time|
|gtin|String (numeric)|GTIN, UPC, ISBN|Universal product identifier|`123456789543`|Optional|—|8-14 digits; no dashes or spaces|
|mpn|String (alphanumeric)|—|Manufacturer part number|`GPT5`|Optional|—|Max 70 chars|
|title|String (UTF-8 text)|—|Product title|`Men's Trail Running Shoes Black`|Required|—|Max 150 chars; avoid all-caps|
|description|String (UTF-8 text)|—|Full product description|`Waterproof trail shoe with cushioned sole...`|Required|—|Max 5,000 chars; plain text only|
|url|URL|RFC 1738|Product detail page URL|`https://example.com/product/SKU12345`|Required|—|Must resolve with HTTP 200; HTTPS preferred|
### Item Information
Capture the physical characteristics and classification details of the product.
This data helps ensure accurate categorization, filtering, and search
relevance.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|brand|String|—|Product brand|`OpenAI`|Required|—|Max 70 chars|
|condition|String|—|Condition of product|`new`|Optional|—|Lower-case string|
|product\_category|String|Category taxonomy|Category path|`Apparel & Accessories \> Shoes`|Optional|—|Use `\>` separator|
|material|String|—|Primary material(s)|`Leather`|Optional|—|Max 100 chars|
|dimensions|String|`LxWxH unit`|Overall dimensions|`12x8x5 in`|Optional|—|Units required if provided|
|length|String|—|Individual dimension|`10`|Optional|Provide all three if using individual fields|Use `dimensions\_unit`|
|width|String|—|Individual dimension|`10`|Optional|Provide all three if using individual fields|Use `dimensions\_unit`|
|height|String|—|Individual dimension|`10`|Optional|Provide all three if using individual fields|Use `dimensions\_unit`|
|dimensions\_unit|String|—|Dimensions unit|`in`|Optional|Required if any of `length`, `width`, `height` are provided|Unit abbreviation (for example, `in`, `cm`)|
|weight|String|—|Product weight|`1.5`|Optional|—|Use `item\_weight\_unit`|
|item\_weight\_unit|String|—|Product weight unit|`lb`|Optional|Required if `weight` is provided|Unit abbreviation (for example, `lb`, `kg`)|
|age\_group|Enum|`newborn`, `infant`, `toddler`, `kids`, `adult`|Target demographic|`adult`|Optional|—|Lower-case string|
### Media
Supply visual and rich media assets that represent the product. High-quality
images and optional videos or 3D models improve user trust and engagement.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|image\_url|URL|RFC 1738|Main product image URL|`https://example.com/image1.jpg`|Required|—|JPEG/PNG; HTTPS preferred|
|additional\_image\_urls|String|—|Extra images|`https://example.com/image2.jpg,...`|Optional|—|Comma-separated list|
|video\_url|URL|RFC 1738|Product video|`https://youtu.be/12345`|Optional|—|Must be publicly accessible|
|model\_3d\_url|URL|RFC 1738|3D model|`https://example.com/model.glb`|Optional|—|GLB/GLTF preferred|
### Price & Promotions
Define standard and promotional pricing information. These attributes power
price display, discount messaging, and offer comparisons.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|price|Number + currency|ISO 4217|Regular price|`79.99 USD`|Required|—|Must include currency code|
|sale\_price|Number + currency|ISO 4217|Discounted price|`59.99 USD`|Optional|—|Must be less than or equal to `price`|
|sale\_price\_start\_date|Date|ISO 8601|Sale start date|`2025-07-01`|Optional|—|Must be valid ISO 8601 date|
|sale\_price\_end\_date|Date|ISO 8601|Sale end date|`2025-07-15`|Optional|—|Must be valid ISO 8601 date|
|unit\_pricing\_measure / base\_measure|Number + unit|—|Unit price and base measure|`16 oz / 1 oz`|Optional|—|Both fields required together|
|pricing\_trend|String|—|Lowest price in N months|`Lowest price in 6 months`|Optional|—|Max 80 chars|
### Availability & Inventory
Describe current stock levels and key timing signals for product availability.
Accurate inventory data ensures users only see items they can actually
purchase.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|availability|Enum|`in\_stock`, `out\_of\_stock`, `pre\_order`, `backorder`, `unknown`|Product availability|`in\_stock`|Required|—|Lower-case string|
|availability\_date|Date|ISO 8601|Availability date if pre-order|`2025-12-01`|Required if `availability=pre\_order`|—|Must be future date|
|expiration\_date|Date|ISO 8601|Remove product after date|`2025-12-01`|Optional|—|Must be future date|
|pickup\_method|Enum|`in\_store`, `reserve`, `not\_supported`|Pickup options|`in\_store`|Optional|—|Lower-case string|
|pickup\_sla|Number + duration|—|Pickup SLA|`1 day`|Optional|Requires `pickup\_method`|Positive integer + unit|
### Variants
Specify how related SKUs vary by size, color, or other options. Variant data
supports better matching, cleaner product grouping, and more precise product
recommendations.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|group\_id|String|—|Shared group identifier|`SHOE123`|Recommended, if listing has variants|—|Stable across related variants|
|listing\_has\_variations|Boolean|`true`, `false`|Indicates whether listing has variants|`true`|Recommended|—|Lower-case string|
|variant\_dict|Object|—|Variant attributes map|A map of option names to values, such as color to Blue and size to 10|Recommended, if listing has variants|—|JSON object with string values|
|item\_group\_title|String (UTF-8 text)|—|Group product title|`Men's Trail Running Shoes`|Optional|—|Max 150 chars; avoid all-caps|
|color|String|—|Variant color|`Blue`|Optional|—|Max 40 chars|
|size|String|—|Variant size|`10`|Recommended (apparel)|—|Max 20 chars|
|size\_system|Country code|ISO 3166|Size system|`US`|Recommended (apparel)|—|2-letter country code|
|gender|String|—|Gender target|`male`|Optional|—|Lower-case string|
|offer\_id|String|—|Offer ID (SKU+seller+price)|`SKU12345-Blue-79.99`|Optional|—|Unique within feed|
|Custom\_variant1\_category|String|—|Custom variant dimension 1|`Size\_Type`|Optional|—|—|
|Custom\_variant1\_option|String|—|Custom variant 1 option|`Petite / Tall / Maternity`|Optional|—|—|
|Custom\_variant2\_category|String|—|Custom variant dimension 2|`Wood\_Type`|Optional|—|—|
|Custom\_variant2\_option|String|—|Custom variant 2 option|`Oak / Mahogany / Walnut`|Optional|—|—|
|Custom\_variant3\_category|String|—|Custom variant dimension 3|`Cap\_Type`|Optional|—|—|
|Custom\_variant3\_option|String|—|Custom variant 3 option|`Snapback / Fitted`|Optional|—|—|
### Fulfillment
Outline shipping methods, costs, and estimated delivery times. Providing
detailed shipping information helps users understand fulfillment options
upfront.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|shipping|String|country:region:service\_class:price:min\_handling\_days:max\_handling\_days:min\_transit\_days:max\_transit\_days|Shipping information|`US:CA:Overnight:16.00 USD:1:2:1:3`|Optional|—|Omitting fields is allowed (`US::Overnight:16.00 USD`); use colon separators|
|is\_digital|Boolean|`true`, `false`|Indicates if the product is digital|`false`|Optional|—|Lower-case string|
### Merchant Info
Identify the seller and link to any relevant merchant policies or storefront
pages. This ensures proper attribution and enables users to review seller
credentials.
Note about 3P sellers and marketplaces: If your feed contains products that
are shipped with 3rd party sellers, please also include a
`marketplace\_seller` in your feed. The `marketplace\_seller` would be the point
of checkout in this scenario, and the `seller\_name` would be the shipment
fulfiller.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|seller\_name|String|—|Seller name|`Example Store`|Required / Display|—|Max 70 chars|
|marketplace\_seller|String|—|Marketplace seller of record|`Marketplace Name`|Optional|—|Max 70 chars|
|seller\_url|URL|RFC 1738|Seller page|`https://example.com/store`|Required|—|HTTPS preferred|
|seller\_privacy\_policy|URL|RFC 1738|Seller-specific policies|`https://example.com/privacy`|Required if `is\_eligible\_checkout` is true|—|HTTPS preferred|
|seller\_tos|URL|RFC 1738|Seller-specific terms of service|`https://example.com/terms`|Required if `is\_eligible\_checkout` is true|—|HTTPS preferred|
### Returns
Provide return policies and time windows to set clear expectations for buyers.
Transparent return data builds trust and reduces post-purchase confusion.
Use `return\_deadline\_in\_days` as the canonical field for return windows in the
feed schema.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|accepts\_returns|Boolean|`true`, `false`|Accepts returns|`true`|Optional|—|Lower-case string|
|return\_deadline\_in\_days|Integer|Days|Days allowed for return|`30`|Optional|—|Positive integer|
|accepts\_exchanges|Boolean|`true`, `false`|Accepts exchanges|`false`|Optional|—|Lower-case string|
|return\_policy|URL|RFC 1738|Return policy URL|`https://example.com/returns`|Required|—|HTTPS preferred|
### Performance Signals
Share popularity and return-rate metrics where available. These signals can be
used to enhance ranking and highlight high-performing products.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|popularity\_score|Number|—|Popularity indicator|`4.7`|Optional|—|0-5 scale or merchant-defined|
|return\_rate|Number|Percentage|Return rate|`2%`|Optional|—|0-100%|
### Compliance
Include regulatory warnings, disclaimers, or age restrictions. Compliance
fields help meet legal obligations and protect consumers.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|warning / warning\_url|String / URL|—|Product disclaimers|`Contains lithium battery, or CA Prop 65 warning`|Recommended for Checkout|—|If URL, must resolve HTTP 200|
|age\_restriction|Number|—|Minimum purchase age|`21`|Recommended|—|Positive integer|
### Reviews and Q&A
Supply aggregated review statistics and frequently asked questions.
User-generated insights strengthen credibility and help shoppers make informed
decisions.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|review\_count|Integer|—|Number of product reviews|`254`|Optional|—|Non-negative|
|star\_rating|String|—|Average review score|`4.50`|Optional|—|0-5 scale|
|store\_review\_count|Integer|—|Number of brand or store reviews|`2000`|Optional|—|Non-negative|
|store\_star\_rating|String|—|Average store rating|`4.50`|Optional|—|0-5 scale|
|q\_and\_a|List|—|FAQ content|A list of question and answer pairs, for example one question asking whether the item is waterproof and one answer saying Yes|Recommended|—|List of objects containing string `q` and string `a` fields|
|reviews|List|—|Review entries|A list of review objects including title, content, minRating, maxRating, and rating values|Recommended|—|List of objects containing `title`, `content`, `minRating`, `maxRating`, and `rating` fields|
### Related Products
List products that are commonly bought together or act as substitutes. This
enables basket-building recommendations and cross-sell opportunities.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|related\_product\_id|String|—|Associated product IDs|`SKU67890`|Recommended|—|Comma-separated list allowed|
|relationship\_type|Enum|`part\_of\_set`, `required\_part`, `often\_bought\_with`, `substitute`, `different\_brand`, `accessory`|Relationship type|`part\_of\_set`|Recommended|—|Lower-case string|
### Geo Tagging
Indicate any region-specific pricing or availability overrides. Geo data allows
ChatGPT to present accurate offers and stock status by location.
|Attribute|Data Type|Supported Values|Description|Example|Requirement|Dependencies|Validation Rules|
|target\_countries|List|`US`|Target countries of the item (first entry used)|`US`|Required|—|Use ISO 3166-1 alpha-2 codes|
|store\_country|String|`US`|Store country of the item|`US`|Required|—|Use ISO 3166-1 alpha-2 codes|
|geo\_price|Number + currency|Region-specific price|Price by region|`79.99 USD (California)`|Optional|—|Must include ISO 4217 currency|
|geo\_availability|String|Region-specific availability|Availability per region|`in\_stock (Texas), out\_of\_stock (New York)`|Optional|—|Regions must be valid ISO 3166 codes|