# Cloud Quickstart
# Quick Start with Qdrant Cloud
Learn how to set up Qdrant Cloud and perform your first semantic search in just a few minutes. We'll use a sample dataset of menu items embedded with the `sentence-transformers/all-MiniLM-L6-v2` model via [Cloud Inference](/documentation/inference/index.md). This is one of the free embedding models available on Qdrant Cloud. For a list of the available free and paid models, refer to the Inference tab of the Cluster Detail page in the Qdrant Cloud Console.
## 1. Create a Cloud Cluster
1. Register for a [Cloud account](https://cloud.qdrant.io/signup) with your email, Google or Github credentials.
2. Under **Create a Free Cluster**, enter a cluster name and select your preferred cloud provider and region. Click **Create Free Cluster**.
3. Copy your **API key** when prompted - you'll need it to connect. Store it somewhere safe as it won't be displayed again.
For detailed cluster setup instructions, see the [Cloud documentation](/documentation/deploy-intro/index.md).
## 2. Install the Qdrant Client
Once you have a cluster, the fastest way to get started is to use our official SDKs which provide a convenient interface for working with Qdrant in your preferred programming language.
```bash
pip install qdrant-client # for Python projects
# cargo add qdrant-client # for Rust projects
# npm install @qdrant/js-client-rest # for Node.js projects
# dotnet add package Qdrant.Client # for .NET projects
# go get github.com/qdrant/go-client # for Go projects
```
## 3. Connect to Qdrant Cloud
Import the qdrant client and create a connection to your Qdrant Cloud cluster using your cluster URL and API key.
```python
from qdrant_client import QdrantClient
from qdrant_client.models import Distance, VectorParams, PointStruct, Document
# connect to Qdrant Cloud
client = QdrantClient(
url="https://xyz-example.eu-central.aws.cloud.qdrant.io",
api_key="your-api-key",
cloud_inference=True
)
```
```rust
use qdrant_client::{Qdrant, Payload};
use qdrant_client::qdrant::{CreateCollectionBuilder, Distance, VectorParamsBuilder, PointStruct, DocumentBuilder, UpsertPointsBuilder, QueryPointsBuilder, Query};
use serde_json::json;
// connect to Qdrant Cloud
let client = Qdrant::from_url("https://xyz-example.eu-central.aws.cloud.qdrant.io:6334")
.api_key("your-api-key")
.build()?;
```
```typescript
import { QdrantClient } from "@qdrant/js-client-rest";
const client = new QdrantClient({
url: "https://xyz-example.eu-central.aws.cloud.qdrant.io",
apiKey: "your-api-key",
});
```
```java
import static io.qdrant.client.PointIdFactory.id;
import static io.qdrant.client.QueryFactory.nearest;
import static io.qdrant.client.ValueFactory.value;
import static io.qdrant.client.VectorsFactory.vectors;
import io.qdrant.client.QdrantClient;
import io.qdrant.client.QdrantGrpcClient;
import io.qdrant.client.grpc.Points.Document;
import io.qdrant.client.grpc.Points.PointStruct;
import io.qdrant.client.grpc.Points.QueryPoints;
import io.qdrant.client.grpc.Points.ScoredPoint;
import io.qdrant.client.grpc.Points.WithPayloadSelector;
import io.qdrant.client.grpc.Collections.Distance;
import io.qdrant.client.grpc.Collections.VectorParams;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
QdrantClient client =
new QdrantClient(
QdrantGrpcClient.newBuilder("xyz-example.qdrant.io", 6334, true)
.withApiKey("")
.build());
```
```csharp
using Qdrant.Client;
using Qdrant.Client.Grpc;
var client = new QdrantClient(
host: "xyz-example.qdrant.io",
port: 6334,
https: true,
apiKey: ""
);
```
```go
import (
"context"
"fmt"
"github.com/qdrant/go-client/qdrant"
)
client, err := qdrant.NewClient(&qdrant.Config{
Host: "xyz-example.qdrant.io",
Port: 6334,
APIKey: "",
UseTLS: true,
})
if err != nil {
fmt.Printf("Failed to create client: %v\\n", err)
return
}
```
```bash
# test the connection
curl -X GET \\
'http://:6333/collections' \\
--header 'api-key: '
```
## 4. Create our collection
We will use some sample menu items to demonstrate how to create a collection and add data to it. Each menu item has a name, description, price, and category. First, we need to create a collection in Qdrant to store our menu items.
```python
# create collection
client.create\_collection(
collection\_name="items",
vectors\_config=VectorParams(size=384, distance=Distance.COSINE),
)
```
```rust
// create collection
client.create\_collection(
CreateCollectionBuilder::new("items")
.vectors\_config(VectorParamsBuilder::new(384, Distance::Cosine)),
)
.await?;
```
```typescript
await client.createCollection("items", {
vectors: { size: 384, distance: "Cosine" },
});
```
```java
client.createCollectionAsync("items",
VectorParams.newBuilder().setDistance(Distance.Cosine).setSize(384).build()).get();
```
```csharp
await client.CreateCollectionAsync(
collectionName: "items",
vectorsConfig: new VectorParams { Size = 384, Distance = Distance.Cosine }
);
```
```go
client.CreateCollection(context.Background(), &qdrant.CreateCollection{
CollectionName: "items",
VectorsConfig: qdrant.NewVectorsConfig(&qdrant.VectorParams{
Size: 384,
Distance: qdrant.Distance\_Cosine,
}),
})
```
```bash
curl -X PUT \\
'http://:6333/collections/items' \\
--header 'api-key: ' \\
--header 'Content-Type: application/json' \\
--data-raw '{
"vectors": {
"size": 384,
"distance": "Cosine"
}
}'
```
## 5. Populate the collection
Next, we will populate the collection with menu items. Each item will be represented as a point in the collection with its associated metadata. Instead of generating embeddings locally, we pass a `Document` object with the text and model name — Qdrant Cloud Inference handles the embedding automatically.
```python
menu\_items = [
("Pad Thai with Tofu", "Stir-fried rice noodles with tofu bean sprouts scallions and crushed peanuts in traditional tamarind sauce", "$13.95", "Noodles"),
("Grilled Salmon Fillet", "Wild-caught Atlantic salmon grilled with lemon butter and fresh herbs served with seasonal vegetables", "$24.50", "Seafood Entrees"),
("Mushroom Risotto", "Creamy arborio rice with mixed mushrooms parmesan truffle oil and fresh thyme", "$16.75", "Vegetarian"),
("Bibimbap Bowl", "Korean rice bowl with seasoned vegetables fried egg gochujang sauce and choice of protein", "$14.50", "Korean Bowls"),
("Falafel Wrap", "Crispy chickpea fritters with hummus tahini cucumber tomato and pickled vegetables in warm pita", "$11.25", "Mediterranean"),
("Shrimp Tacos", "Three soft tacos with grilled shrimp cabbage slaw chipotle aioli and fresh lime", "$13.00", "Tacos"),
("Vegetable Curry", "Mixed vegetables in aromatic coconut curry sauce with jasmine rice and naan bread", "$12.95", "Indian Curries"),
("Tuna Poke Bowl", "Fresh ahi tuna with avocado edamame cucumber seaweed salad over sushi rice with spicy mayo", "$16.50", "Poke Bowls"),
("Margherita Pizza", "Fresh mozzarella san marzano tomatoes basil and extra virgin olive oil on wood-fired crust", "$14.00", "Pizza"),
("Chicken Tikka Masala", "Tandoori chicken in creamy tomato sauce with aromatic spices served with basmati rice", "$15.95", "Indian Entrees"),
("Greek Salad", "Romaine lettuce tomatoes cucumbers kalamata olives feta cheese red onion with lemon oregano dressing", "$10.50", "Salads"),
("Lobster Roll", "Fresh Maine lobster meat with light mayo on toasted buttery roll served with chips", "$22.00", "Seafood Sandwiches"),
("Quinoa Buddha Bowl", "Organic quinoa with roasted chickpeas kale sweet potato tahini dressing and hemp seeds", "$13.50", "Healthy Bowls"),
("Beef Pho", "Traditional Vietnamese beef noodle soup with rice noodles fresh herbs bean sprouts and lime", "$12.75", "Noodle Soups"),
("Eggplant Parmesan", "Breaded eggplant layered with marinara mozzarella and parmesan served with pasta", "$15.25", "Italian Entrees"),
("Crab Cakes", "Maryland-style lump crab cakes with remoulade sauce and mixed greens", "$18.50", "Seafood Appetizers"),
("Tofu Stir Fry", "Crispy tofu with broccoli bell peppers snap peas in garlic ginger sauce over steamed rice", "$12.50", "Vegetarian Entrees"),
("Salmon Sushi Platter", "12 pieces of fresh salmon nigiri and sashimi with wasabi pickled ginger and soy sauce", "$19.95", "Sushi"),
("Caprese Sandwich", "Fresh mozzarella tomatoes basil pesto balsamic glaze on ciabatta bread", "$11.75", "Sandwiches"),
("Tom Yum Soup", "Spicy and sour Thai soup with shrimp lemongrass galangal mushrooms and kaffir lime leaves", "$11.50", "Soups"),
("Lentil Dal", "Red lentils simmered with turmeric cumin coriander served with rice and naan", "$11.95", "Vegan Entrees"),
("Fish and Chips", "Beer-battered cod with crispy fries malt vinegar and tartar sauce", "$16.00", "British Classics"),
("Veggie Burger", "House-made black bean and quinoa patty with avocado sprouts tomato on brioche bun", "$13.25", "Burgers"),
("Miso Ramen", "Rich miso broth with ramen noodles soft-boiled egg bamboo shoots nori and scallions", "$14.50", "Ramen"),
("Stuffed Bell Peppers", "Roasted bell peppers filled with rice vegetables herbs and melted cheese", "$13.75", "Vegetarian Entrees"),
("Scallop Risotto", "Pan-seared sea scallops over creamy parmesan risotto with white wine and lemon", "$26.50", "Seafood Specials"),
("Spring Rolls", "Fresh rice paper rolls with vegetables tofu rice noodles herbs and peanut dipping sauce", "$8.95", "Appetizers"),
("Oyster Po Boy", "Fried oysters with lettuce tomato pickles and remoulade on french bread", "$15.50", "Sandwiches"),
("Portobello Mushroom Steak", "Grilled portobello cap marinated in balsamic with roasted vegetables and quinoa", "$14.95", "Vegan Entrees"),
("Coconut Shrimp", "Jumbo shrimp breaded in shredded coconut served with sweet chili sauce", "$14.25", "Seafood Appetizers")
]
# points generator
points = []
for i, menu\_item in enumerate(menu\_items):
point = PointStruct(
id=i,
vector=Document(
text=f"{menu\_item[0]} {menu\_item[1]}",
model="sentence-transformers/all-MiniLM-L6-v2"
),
payload={
"item\_name": menu\_item[0],
"description": menu\_item[1],
"price": menu\_item[2],
"category": menu\_item[3],
}
)
points.append(point)
# upsert points to collection
client.upsert(
collection\_name="items",
points=points,
)
```
```rust
// generate embeddings and prepare points
let menu\_items = vec![
(
"Pad Thai with Tofu",
"Stir-fried rice noodles with tofu bean sprouts scallions and crushed peanuts in traditional tamarind sauce",
"$13.95",
"Noodles",
),
(
"Grilled Salmon Fillet",
"Wild-caught Atlantic salmon grilled with lemon butter and fresh herbs served with seasonal vegetables",
"$24.50",
"Seafood Entrees",
),
(
"Mushroom Risotto",
"Creamy arborio rice with mixed mushrooms parmesan truffle oil and fresh thyme",
"$16.75",
"Vegetarian",
),
(
"Bibimbap Bowl",
"Korean rice bowl with seasoned vegetables fried egg gochujang sauce and choice of protein",
"$14.50",
"Korean Bowls",
),
(
"Falafel Wrap",
"Crispy chickpea fritters with hummus tahini cucumber tomato and pickled vegetables in warm pita",
"$11.25",
"Mediterranean",
),
(
"Shrimp Tacos",
"Three soft tacos with grilled shrimp cabbage slaw chipotle aioli and fresh lime",
"$13.00",
"Tacos",
),
(
"Vegetable Curry",
"Mixed vegetables in aromatic coconut curry sauce with jasmine rice and naan bread",
"$12.95",
"Indian Curries",
),
(
"Tuna Poke Bowl",
"Fresh ahi tuna with avocado edamame cucumber seaweed salad over sushi rice with spicy mayo",
"$16.50",
"Poke Bowls",
),
(
"Margherita Pizza",
"Fresh mozzarella san marzano tomatoes basil and extra virgin olive oil on wood-fired crust",
"$14.00",
"Pizza",
),
(
"Chicken Tikka Masala",
"Tandoori chicken in creamy tomato sauce with aromatic spices served with basmati rice",
"$15.95",
"Indian Entrees",
),
(
"Greek Salad",
"Romaine lettuce tomatoes cucumbers kalamata olives feta cheese red onion with lemon oregano dressing",
"$10.50",
"Salads",
),
(
"Lobster Roll",
"Fresh Maine lobster meat with light mayo on toasted buttery roll served with chips",
"$22.00",
"Seafood Sandwiches",
),
(
"Quinoa Buddha Bowl",
"Organic quinoa with roasted chickpeas kale sweet potato tahini dressing and hemp seeds",
"$13.50",
"Healthy Bowls",
),
(
"Beef Pho",
"Traditional Vietnamese beef noodle soup with rice noodles fresh herbs bean sprouts and lime",
"$12.75",
"Noodle Soups",
),
(
"Eggplant Parmesan",
"Breaded eggplant layered with marinara mozzarella and parmesan served with pasta",
"$15.25",
"Italian Entrees",
),
(
"Crab Cakes",
"Maryland-style lump crab cakes with remoulade sauce and mixed greens",
"$18.50",
"Seafood Appetizers",
),
(
"Tofu Stir Fry",
"Crispy tofu with broccoli bell peppers snap peas in garlic ginger sauce over steamed rice",
"$12.50",
"Vegetarian Entrees",
),
(
"Salmon Sushi Platter",
"12 pieces of fresh salmon nigiri and sashimi with wasabi pickled ginger and soy sauce",
"$19.95",
"Sushi",
),
(
"Caprese Sandwich",
"Fresh mozzarella tomatoes basil pesto balsamic glaze on ciabatta bread",
"$11.75",
"Sandwiches",
),
(
"Tom Yum Soup",
"Spicy and sour Thai soup with shrimp lemongrass galangal mushrooms and kaffir lime leaves",
"$11.50",
"Soups",
),
(
"Lentil Dal",
"Red lentils simmered with turmeric cumin coriander served with rice and naan",
"$11.95",
"Vegan Entrees",
),
(
"Fish and Chips",
"Beer-battered cod with crispy fries malt vinegar and tartar sauce",
"$16.00",
"British Classics",
),
(
"Veggie Burger",
"House-made black bean and quinoa patty with avocado sprouts tomato on brioche bun",
"$13.25",
"Burgers",
),
(
"Miso Ramen",
"Rich miso broth with ramen noodles soft-boiled egg bamboo shoots nori and scallions",
"$14.50",
"Ramen",
),
(
"Stuffed Bell Peppers",
"Roasted bell peppers filled with rice vegetables herbs and melted cheese",
"$13.75",
"Vegetarian Entrees",
),
(
"Scallop Risotto",
"Pan-seared sea scallops over creamy parmesan risotto with white wine and lemon",
"$26.50",
"Seafood Specials",
),
(
"Spring Rolls",
"Fresh rice paper rolls with vegetables tofu rice noodles herbs and peanut dipping sauce",
"$8.95",
"Appetizers",
),
(
"Oyster Po Boy",
"Fried oysters with lettuce tomato pickles and remoulade on french bread",
"$15.50",
"Sandwiches",
),
(
"Portobello Mushroom Steak",
"Grilled portobello cap marinated in balsamic with roasted vegetables and quinoa",
"$14.95",
"Vegan Entrees",
),
(
"Coconut Shrimp",
"Jumbo shrimp breaded in shredded coconut served with sweet chili sauce",
"$14.25",
"Seafood Appetizers",
),
];
let points = menu\_items
.into\_iter()
.enumerate()
.map(|(idx, menu\_item)| {
PointStruct::new(
idx as u64,
DocumentBuilder::new(
format!("{} {}", menu\_item.0, menu\_item.1),
"sentence-transformers/all-MiniLM-L6-v2"
)
.build(),
Payload::try\_from(json!({
"item\_name": menu\_item.0,
"description": menu\_item.1,
"price": menu\_item.2,
"category": menu\_item.3,
}))
.unwrap(),
)
})
.collect::\>();
let \_ = client
.upsert\_points(UpsertPointsBuilder::new("items", points).wait(true))
.await;
```
```typescript
let menuItems = [
[
"Pad Thai with Tofu",
"Stir-fried rice noodles with tofu bean sprouts scallions and crushed peanuts in traditional tamarind sauce",
"$13.95",
"Noodles",
],
[
"Grilled Salmon Fillet",
"Wild-caught Atlantic salmon grilled with lemon butter and fresh herbs served with seasonal vegetables",
"$24.50",
"Seafood Entrees",
],
[
"Mushroom Risotto",
"Creamy arborio rice with mixed mushrooms parmesan truffle oil and fresh thyme",
"$16.75",
"Vegetarian",
],
[
"Bibimbap Bowl",
"Korean rice bowl with seasoned vegetables fried egg gochujang sauce and choice of protein",
"$14.50",
"Korean Bowls",
],
[
"Falafel Wrap",
"Crispy chickpea fritters with hummus tahini cucumber tomato and pickled vegetables in warm pita",
"$11.25",
"Mediterranean",
],
[
"Shrimp Tacos",
"Three soft tacos with grilled shrimp cabbage slaw chipotle aioli and fresh lime",
"$13.00",
"Tacos",
],
[
"Vegetable Curry",
"Mixed vegetables in aromatic coconut curry sauce with jasmine rice and naan bread",
"$12.95",
"Indian Curries",
],
[
"Tuna Poke Bowl",
"Fresh ahi tuna with avocado edamame cucumber seaweed salad over sushi rice with spicy mayo",
"$16.50",
"Poke Bowls",
],
[
"Margherita Pizza",
"Fresh mozzarella san marzano tomatoes basil and extra virgin olive oil on wood-fired crust",
"$14.00",
"Pizza",
],
[
"Chicken Tikka Masala",
"Tandoori chicken in creamy tomato sauce with aromatic spices served with basmati rice",
"$15.95",
"Indian Entrees",
],
[
"Greek Salad",
"Romaine lettuce tomatoes cucumbers kalamata olives feta cheese red onion with lemon oregano dressing",
"$10.50",
"Salads",
],
[
"Lobster Roll",
"Fresh Maine lobster meat with light mayo on toasted buttery roll served with chips",
"$22.00",
"Seafood Sandwiches",
],
[
"Quinoa Buddha Bowl",
"Organic quinoa with roasted chickpeas kale sweet potato tahini dressing and hemp seeds",
"$13.50",
"Healthy Bowls",
],
[
"Beef Pho",
"Traditional Vietnamese beef noodle soup with rice noodles fresh herbs bean sprouts and lime",
"$12.75",
"Noodle Soups",
],
[
"Eggplant Parmesan",
"Breaded eggplant layered with marinara mozzarella and parmesan served with pasta",
"$15.25",
"Italian Entrees",
],
[
"Crab Cakes",
"Maryland-style lump crab cakes with remoulade sauce and mixed greens",
"$18.50",
"Seafood Appetizers",
],
[
"Tofu Stir Fry",
"Crispy tofu with broccoli bell peppers snap peas in garlic ginger sauce over steamed rice",
"$12.50",
"Vegetarian Entrees",
],
[
"Salmon Sushi Platter",
"12 pieces of fresh salmon nigiri and sashimi with wasabi pickled ginger and soy sauce",
"$19.95",
"Sushi",
],
[
"Caprese Sandwich",
"Fresh mozzarella tomatoes basil pesto balsamic glaze on ciabatta bread",
"$11.75",
"Sandwiches",
],
[
"Tom Yum Soup",
"Spicy and sour Thai soup with shrimp lemongrass galangal mushrooms and kaffir lime leaves",
"$11.50",
"Soups",
],
[
"Lentil Dal",
"Red lentils simmered with turmeric cumin coriander served with rice and naan",
"$11.95",
"Vegan Entrees",
],
[
"Fish and Chips",
"Beer-battered cod with crispy fries malt vinegar and tartar sauce",
"$16.00",
"British Classics",
],
[
"Veggie Burger",
"House-made black bean and quinoa patty with avocado sprouts tomato on brioche bun",
"$13.25",
"Burgers",
],
[
"Miso Ramen",
"Rich miso broth with ramen noodles soft-boiled egg bamboo shoots nori and scallions",
"$14.50",
"Ramen",
],
[
"Stuffed Bell Peppers",
"Roasted bell peppers filled with rice vegetables herbs and melted cheese",
"$13.75",
"Vegetarian Entrees",
],
[
"Scallop Risotto",
"Pan-seared sea scallops over creamy parmesan risotto with white wine and lemon",
"$26.50",
"Seafood Specials",
],
[
"Spring Rolls",
"Fresh rice paper rolls with vegetables tofu rice noodles herbs and peanut dipping sauce",
"$8.95",
"Appetizers",
],
[
"Oyster Po Boy",
"Fried oysters with lettuce tomato pickles and remoulade on french bread",
"$15.50",
"Sandwiches",
],
[
"Portobello Mushroom Steak",
"Grilled portobello cap marinated in balsamic with roasted vegetables and quinoa",
"$14.95",
"Vegan Entrees",
],
[
"Coconut Shrimp",
"Jumbo shrimp breaded in shredded coconut served with sweet chili sauce",
"$14.25",
"Seafood Appetizers",
],
] as const;
// generate embeddings and prepare points
const points: any[] = [];
let idx = 0;
for (const menuItem of menuItems) {
points.push({
id: idx,
vector: {
text: `${menuItem[0]} ${menuItem[1]}`,
model: "sentence-transformers/all-MiniLM-L6-v2",
},
payload: {
item\_name: menuItem[0],
description: menuItem[1],
price: menuItem[2],
category: menuItem[3],
},
});
idx++;
}
// upsert points to collection
await client.upsert("items", { points });
```
```java
String[][] menuItems = {
{"Pad Thai with Tofu", "Stir-fried rice noodles with tofu bean sprouts scallions and crushed peanuts in traditional tamarind sauce", "$13.95", "Noodles"},
{"Grilled Salmon Fillet", "Wild-caught Atlantic salmon grilled with lemon butter and fresh herbs served with seasonal vegetables", "$24.50", "Seafood Entrees"},
{"Mushroom Risotto", "Creamy arborio rice with mixed mushrooms parmesan truffle oil and fresh thyme", "$16.75", "Vegetarian"},
{"Bibimbap Bowl", "Korean rice bowl with seasoned vegetables fried egg gochujang sauce and choice of protein", "$14.50", "Korean Bowls"},
{"Falafel Wrap", "Crispy chickpea fritters with hummus tahini cucumber tomato and pickled vegetables in warm pita", "$11.25", "Mediterranean"},
{"Shrimp Tacos", "Three soft tacos with grilled shrimp cabbage slaw chipotle aioli and fresh lime", "$13.00", "Tacos"},
{"Vegetable Curry", "Mixed vegetables in aromatic coconut curry sauce with jasmine rice and naan bread", "$12.95", "Indian Curries"},
{"Tuna Poke Bowl", "Fresh ahi tuna with avocado edamame cucumber seaweed salad over sushi rice with spicy mayo", "$16.50", "Poke Bowls"},
{"Margherita Pizza", "Fresh mozzarella san marzano tomatoes basil and extra virgin olive oil on wood-fired crust", "$14.00", "Pizza"},
{"Chicken Tikka Masala", "Tandoori chicken in creamy tomato sauce with aromatic spices served with basmati rice", "$15.95", "Indian Entrees"},
{"Greek Salad", "Romaine lettuce tomatoes cucumbers kalamata olives feta cheese red onion with lemon oregano dressing", "$10.50", "Salads"},
{"Lobster Roll", "Fresh Maine lobster meat with light mayo on toasted buttery roll served with chips", "$22.00", "Seafood Sandwiches"},
{"Quinoa Buddha Bowl", "Organic quinoa with roasted chickpeas kale sweet potato tahini dressing and hemp seeds", "$13.50", "Healthy Bowls"},
{"Beef Pho", "Traditional Vietnamese beef noodle soup with rice noodles fresh herbs bean sprouts and lime", "$12.75", "Noodle Soups"},
{"Eggplant Parmesan", "Breaded eggplant layered with marinara mozzarella and parmesan served with pasta", "$15.25", "Italian Entrees"},
{"Crab Cakes", "Maryland-style lump crab cakes with remoulade sauce and mixed greens", "$18.50", "Seafood Appetizers"},
{"Tofu Stir Fry", "Crispy tofu with broccoli bell peppers snap peas in garlic ginger sauce over steamed rice", "$12.50", "Vegetarian Entrees"},
{"Salmon Sushi Platter", "12 pieces of fresh salmon nigiri and sashimi with wasabi pickled ginger and soy sauce", "$19.95", "Sushi"},
{"Caprese Sandwich", "Fresh mozzarella tomatoes basil pesto balsamic glaze on ciabatta bread", "$11.75", "Sandwiches"},
{"Tom Yum Soup", "Spicy and sour Thai soup with shrimp lemongrass galangal mushrooms and kaffir lime leaves", "$11.50", "Soups"},
{"Lentil Dal", "Red lentils simmered with turmeric cumin coriander served with rice and naan", "$11.95", "Vegan Entrees"},
{"Fish and Chips", "Beer-battered cod with crispy fries malt vinegar and tartar sauce", "$16.00", "British Classics"},
{"Veggie Burger", "House-made black bean and quinoa patty with avocado sprouts tomato on brioche bun", "$13.25", "Burgers"},
{"Miso Ramen", "Rich miso broth with ramen noodles soft-boiled egg bamboo shoots nori and scallions", "$14.50", "Ramen"},
{"Stuffed Bell Peppers", "Roasted bell peppers filled with rice vegetables herbs and melted cheese", "$13.75", "Vegetarian Entrees"},
{"Scallop Risotto", "Pan-seared sea scallops over creamy parmesan risotto with white wine and lemon", "$26.50", "Seafood Specials"},
{"Spring Rolls", "Fresh rice paper rolls with vegetables tofu rice noodles herbs and peanut dipping sauce", "$8.95", "Appetizers"},
{"Oyster Po Boy", "Fried oysters with lettuce tomato pickles and remoulade on french bread", "$15.50", "Sandwiches"},
{"Portobello Mushroom Steak", "Grilled portobello cap marinated in balsamic with roasted vegetables and quinoa", "$14.95", "Vegan Entrees"},
{"Coconut Shrimp", "Jumbo shrimp breaded in shredded coconut served with sweet chili sauce", "$14.25", "Seafood Appetizers"},
};
List points = new ArrayList\<\>();
for (int i = 0; i \< menuItems.length; i++) {
points.add(
PointStruct.newBuilder()
.setId(id(i))
.setVectors(vectors(
Document.newBuilder()
.setText(menuItems[i][0] + " " + menuItems[i][1])
.setModel("sentence-transformers/all-MiniLM-L6-v2")
.build()))
.putAllPayload(Map.of(
"item\_name", value(menuItems[i][0]),
"description", value(menuItems[i][1]),
"price", value(menuItems[i][2]),
"category", value(menuItems[i][3])))
.build()
);
}
client.upsertAsync("items", points).get();
```
```csharp
var menuItems = new[] {
("Pad Thai with Tofu", "Stir-fried rice noodles with tofu bean sprouts scallions and crushed peanuts in traditional tamarind sauce", "$13.95", "Noodles"),
("Grilled Salmon Fillet", "Wild-caught Atlantic salmon grilled with lemon butter and fresh herbs served with seasonal vegetables", "$24.50", "Seafood Entrees"),
("Mushroom Risotto", "Creamy arborio rice with mixed mushrooms parmesan truffle oil and fresh thyme", "$16.75", "Vegetarian"),
("Bibimbap Bowl", "Korean rice bowl with seasoned vegetables fried egg gochujang sauce and choice of protein", "$14.50", "Korean Bowls"),
("Falafel Wrap", "Crispy chickpea fritters with hummus tahini cucumber tomato and pickled vegetables in warm pita", "$11.25", "Mediterranean"),
("Shrimp Tacos", "Three soft tacos with grilled shrimp cabbage slaw chipotle aioli and fresh lime", "$13.00", "Tacos"),
("Vegetable Curry", "Mixed vegetables in aromatic coconut curry sauce with jasmine rice and naan bread", "$12.95", "Indian Curries"),
("Tuna Poke Bowl", "Fresh ahi tuna with avocado edamame cucumber seaweed salad over sushi rice with spicy mayo", "$16.50", "Poke Bowls"),
("Margherita Pizza", "Fresh mozzarella san marzano tomatoes basil and extra virgin olive oil on wood-fired crust", "$14.00", "Pizza"),
("Chicken Tikka Masala", "Tandoori chicken in creamy tomato sauce with aromatic spices served with basmati rice", "$15.95", "Indian Entrees"),
("Greek Salad", "Romaine lettuce tomatoes cucumbers kalamata olives feta cheese red onion with lemon oregano dressing", "$10.50", "Salads"),
("Lobster Roll", "Fresh Maine lobster meat with light mayo on toasted buttery roll served with chips", "$22.00", "Seafood Sandwiches"),
("Quinoa Buddha Bowl", "Organic quinoa with roasted chickpeas kale sweet potato tahini dressing and hemp seeds", "$13.50", "Healthy Bowls"),
("Beef Pho", "Traditional Vietnamese beef noodle soup with rice noodles fresh herbs bean sprouts and lime", "$12.75", "Noodle Soups"),
("Eggplant Parmesan", "Breaded eggplant layered with marinara mozzarella and parmesan served with pasta", "$15.25", "Italian Entrees"),
("Crab Cakes", "Maryland-style lump crab cakes with remoulade sauce and mixed greens", "$18.50", "Seafood Appetizers"),
("Tofu Stir Fry", "Crispy tofu with broccoli bell peppers snap peas in garlic ginger sauce over steamed rice", "$12.50", "Vegetarian Entrees"),
("Salmon Sushi Platter", "12 pieces of fresh salmon nigiri and sashimi with wasabi pickled ginger and soy sauce", "$19.95", "Sushi"),
("Caprese Sandwich", "Fresh mozzarella tomatoes basil pesto balsamic glaze on ciabatta bread", "$11.75", "Sandwiches"),
("Tom Yum Soup", "Spicy and sour Thai soup with shrimp lemongrass galangal mushrooms and kaffir lime leaves", "$11.50", "Soups"),
("Lentil Dal", "Red lentils simmered with turmeric cumin coriander served with rice and naan", "$11.95", "Vegan Entrees"),
("Fish and Chips", "Beer-battered cod with crispy fries malt vinegar and tartar sauce", "$16.00", "British Classics"),
("Veggie Burger", "House-made black bean and quinoa patty with avocado sprouts tomato on brioche bun", "$13.25", "Burgers"),
("Miso Ramen", "Rich miso broth with ramen noodles soft-boiled egg bamboo shoots nori and scallions", "$14.50", "Ramen"),
("Stuffed Bell Peppers", "Roasted bell peppers filled with rice vegetables herbs and melted cheese", "$13.75", "Vegetarian Entrees"),
("Scallop Risotto", "Pan-seared sea scallops over creamy parmesan risotto with white wine and lemon", "$26.50", "Seafood Specials"),
("Spring Rolls", "Fresh rice paper rolls with vegetables tofu rice noodles herbs and peanut dipping sauce", "$8.95", "Appetizers"),
("Oyster Po Boy", "Fried oysters with lettuce tomato pickles and remoulade on french bread", "$15.50", "Sandwiches"),
("Portobello Mushroom Steak", "Grilled portobello cap marinated in balsamic with roasted vegetables and quinoa", "$14.95", "Vegan Entrees"),
("Coconut Shrimp", "Jumbo shrimp breaded in shredded coconut served with sweet chili sauce", "$14.25", "Seafood Appetizers"),
};
var points = new List();
for (int i = 0; i \< menuItems.Length; i++)
{
var item = menuItems[i];
points.Add(new PointStruct
{
Id = (ulong)i,
Vectors = new Document
{
Text = $"{item.Item1} {item.Item2}",
Model = "sentence-transformers/all-MiniLM-L6-v2",
},
Payload =
{
["item\_name"] = item.Item1,
["description"] = item.Item2,
["price"] = item.Item3,
["category"] = item.Item4,
},
});
}
await client.UpsertAsync("items", points);
```
```go
type MenuItem struct {
Name, Description, Price, Category string
}
menuItems := []MenuItem{
{"Pad Thai with Tofu", "Stir-fried rice noodles with tofu bean sprouts scallions and crushed peanuts in traditional tamarind sauce", "$13.95", "Noodles"},
{"Grilled Salmon Fillet", "Wild-caught Atlantic salmon grilled with lemon butter and fresh herbs served with seasonal vegetables", "$24.50", "Seafood Entrees"},
{"Mushroom Risotto", "Creamy arborio rice with mixed mushrooms parmesan truffle oil and fresh thyme", "$16.75", "Vegetarian"},
{"Bibimbap Bowl", "Korean rice bowl with seasoned vegetables fried egg gochujang sauce and choice of protein", "$14.50", "Korean Bowls"},
{"Falafel Wrap", "Crispy chickpea fritters with hummus tahini cucumber tomato and pickled vegetables in warm pita", "$11.25", "Mediterranean"},
{"Shrimp Tacos", "Three soft tacos with grilled shrimp cabbage slaw chipotle aioli and fresh lime", "$13.00", "Tacos"},
{"Vegetable Curry", "Mixed vegetables in aromatic coconut curry sauce with jasmine rice and naan bread", "$12.95", "Indian Curries"},
{"Tuna Poke Bowl", "Fresh ahi tuna with avocado edamame cucumber seaweed salad over sushi rice with spicy mayo", "$16.50", "Poke Bowls"},
{"Margherita Pizza", "Fresh mozzarella san marzano tomatoes basil and extra virgin olive oil on wood-fired crust", "$14.00", "Pizza"},
{"Chicken Tikka Masala", "Tandoori chicken in creamy tomato sauce with aromatic spices served with basmati rice", "$15.95", "Indian Entrees"},
{"Greek Salad", "Romaine lettuce tomatoes cucumbers kalamata olives feta cheese red onion with lemon oregano dressing", "$10.50", "Salads"},
{"Lobster Roll", "Fresh Maine lobster meat with light mayo on toasted buttery roll served with chips", "$22.00", "Seafood Sandwiches"},
{"Quinoa Buddha Bowl", "Organic quinoa with roasted chickpeas kale sweet potato tahini dressing and hemp seeds", "$13.50", "Healthy Bowls"},
{"Beef Pho", "Traditional Vietnamese beef noodle soup with rice noodles fresh herbs bean sprouts and lime", "$12.75", "Noodle Soups"},
{"Eggplant Parmesan", "Breaded eggplant layered with marinara mozzarella and parmesan served with pasta", "$15.25", "Italian Entrees"},
{"Crab Cakes", "Maryland-style lump crab cakes with remoulade sauce and mixed greens", "$18.50", "Seafood Appetizers"},
{"Tofu Stir Fry", "Crispy tofu with broccoli bell peppers snap peas in garlic ginger sauce over steamed rice", "$12.50", "Vegetarian Entrees"},
{"Salmon Sushi Platter", "12 pieces of fresh salmon nigiri and sashimi with wasabi pickled ginger and soy sauce", "$19.95", "Sushi"},
{"Caprese Sandwich", "Fresh mozzarella tomatoes basil pesto balsamic glaze on ciabatta bread", "$11.75", "Sandwiches"},
{"Tom Yum Soup", "Spicy and sour Thai soup with shrimp lemongrass galangal mushrooms and kaffir lime leaves", "$11.50", "Soups"},
{"Lentil Dal", "Red lentils simmered with turmeric cumin coriander served with rice and naan", "$11.95", "Vegan Entrees"},
{"Fish and Chips", "Beer-battered cod with crispy fries malt vinegar and tartar sauce", "$16.00", "British Classics"},
{"Veggie Burger", "House-made black bean and quinoa patty with avocado sprouts tomato on brioche bun", "$13.25", "Burgers"},
{"Miso Ramen", "Rich miso broth with ramen noodles soft-boiled egg bamboo shoots nori and scallions", "$14.50", "Ramen"},
{"Stuffed Bell Peppers", "Roasted bell peppers filled with rice vegetables herbs and melted cheese", "$13.75", "Vegetarian Entrees"},
{"Scallop Risotto", "Pan-seared sea scallops over creamy parmesan risotto with white wine and lemon", "$26.50", "Seafood Specials"},
{"Spring Rolls", "Fresh rice paper rolls with vegetables tofu rice noodles herbs and peanut dipping sauce", "$8.95", "Appetizers"},
{"Oyster Po Boy", "Fried oysters with lettuce tomato pickles and remoulade on french bread", "$15.50", "Sandwiches"},
{"Portobello Mushroom Steak", "Grilled portobello cap marinated in balsamic with roasted vegetables and quinoa", "$14.95", "Vegan Entrees"},
{"Coconut Shrimp", "Jumbo shrimp breaded in shredded coconut served with sweet chili sauce", "$14.25", "Seafood Appetizers"},
}
points := make([]\*qdrant.PointStruct, len(menuItems))
for i, item := range menuItems {
points[i] = &qdrant.PointStruct{
Id: qdrant.NewIDNum(uint64(i)),
Vectors: qdrant.NewVectorsDocument(&qdrant.Document{
Text: item.Name + " " + item.Description,
Model: "sentence-transformers/all-MiniLM-L6-v2",
}),
Payload: qdrant.NewValueMap(map[string]any{
"item\_name": item.Name,
"description": item.Description,
"price": item.Price,
"category": item.Category,
}),
}
}
client.Upsert(context.Background(), &qdrant.UpsertPoints{
CollectionName: "items",
Points: points,
})
```
## 6. Search the Menu Items
Now we can search the menu item dataset! We'll use the same `sentence-transformers/all-MiniLM-L6-v2` model in Cloud Inference to embed our query text, then find the best dishes matching that embedding.
```python
# generate query embedding
query\_text = "vegetarian dishes"
# search for similar menu items
results = client.query\_points(
collection\_name="items",
query=Document(text=query\_text, model="sentence-transformers/all-MiniLM-L6-v2"),
with\_payload=True,
limit=5
)
# print results
for result in results.points:
print(f"Item: {result.payload.get('item\_name', 'N/A')}")
print(f"Score: {result.score}")
print(f"Description: {result.payload['description'][:150]}...")
print(f"Price: {result.payload.get('price', 'N/A')}")
print("---")
```
```rust
// generate query embedding
let query\_text = "vegetarian dishes";
let results = client
.query(
QueryPointsBuilder::new("items")
.query(Query::new\_nearest(
DocumentBuilder::new(
query\_text,
"sentence-transformers/all-MiniLM-L6-v2"
)
.build(),
))
.with\_payload(true)
.limit(5),
)
.await
.expect("Query failed");
let na\_str = "N/A".to\_string();
for result in results.result {
let payload = result.payload;
println!("Item: {}", payload.get("item\_name")
.and\_then(|v| v.as\_str()).unwrap\_or(&na\_str));
println!("Score: {}", result.score);
println!("Description: {}", payload.get("description")
.and\_then(|v| v.as\_str()).unwrap\_or(&na\_str));
println!("Price: {}", payload.get("price")
.and\_then(|v| v.as\_str()).unwrap\_or(&na\_str));
println!("---");
}
```
```typescript
// generate query embedding
const queryText = "vegetarian dishes";
// search for similar items
const results = await client.query("items", {
query: {
text: queryText,
model: "sentence-transformers/all-MiniLM-L6-v2",
},
with\_payload: true,
limit: 5,
});
// print results
for (const result of results.points) {
console.log(`Item: ${result.payload?.item\_name || 'N/A'}`);
console.log(`Score: ${result.score}`);
console.log(`Description: ${result.payload?.description || 'N/A'}`);
console.log(`Price: ${result.payload?.price || 'N/A'}`);
console.log('---');
}
```
```java
// generate query embedding
String queryText = "vegetarian dishes";
// search for similar menu items
List results = client
.queryAsync(
QueryPoints.newBuilder()
.setCollectionName("items")
.setQuery(nearest(
Document.newBuilder()
.setText(queryText)
.setModel("sentence-transformers/all-MiniLM-L6-v2")
.build()))
.setWithPayload(
WithPayloadSelector.newBuilder().setEnable(true).build())
.setLimit(5)
.build())
.get();
// print results
for (ScoredPoint result : results) {
System.out.println("Item: " + result.getPayloadMap().get("item\_name").getStringValue());
System.out.println("Score: " + result.getScore());
System.out.println("Description: " + result.getPayloadMap().get("description").getStringValue());
System.out.println("Price: " + result.getPayloadMap().get("price").getStringValue());
System.out.println("---");
}
```
```csharp
// generate query embedding
var queryText = "vegetarian dishes";
// search for similar menu items
var results = await client.QueryAsync(
collectionName: "items",
query: new Document
{
Text = queryText,
Model = "sentence-transformers/all-MiniLM-L6-v2",
},
payloadSelector: true,
limit: 5
);
// print results
foreach (var result in results)
{
Console.WriteLine($"Item: {result.Payload["item\_name"].StringValue}");
Console.WriteLine($"Score: {result.Score}");
Console.WriteLine($"Description: {result.Payload["description"].StringValue}");
Console.WriteLine($"Price: {result.Payload["price"].StringValue}");
Console.WriteLine("---");
}
```
```go
// generate query embedding
queryText := "vegetarian dishes"
// search for similar menu items
results, err := client.Query(context.Background(), &qdrant.QueryPoints{
CollectionName: "items",
Query: qdrant.NewQueryNearest(
qdrant.NewVectorInputDocument(&qdrant.Document{
Text: queryText,
Model: "sentence-transformers/all-MiniLM-L6-v2",
}),
),
WithPayload: qdrant.NewWithPayload(true),
Limit: qdrant.PtrOf(uint64(5)),
})
// print results
for \_, result := range results {
fmt.Printf("Item: %s\\n", result.Payload["item\_name"].GetStringValue())
fmt.Printf("Score: %f\\n", result.Score)
fmt.Printf("Description: %s\\n", result.Payload["description"].GetStringValue())
fmt.Printf("Price: %s\\n", result.Payload["price"].GetStringValue())
fmt.Println("---")
}
```
## That's Vector Search!
You've just performed semantic search on real menu item data. The query "vegetarian dishes" returned similar menu items based on meaning, not just keyword matching.
## What's Next?
- Explore [filtering](/documentation/search/filtering/index.md) to combine semantic search with structured queries
- Learn about [collections](/documentation/manage-data/collections/index.md) and advanced configuration options
- Check out more [examples and tutorials](/documentation/tutorials-lp-overview/index.md)