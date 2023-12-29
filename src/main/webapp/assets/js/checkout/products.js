//product.js
export function getProduct(productId) {
  let matchingProduct;

  products.forEach((product) => {
    if (product.id === productId) {
      matchingProduct = product;
    }
  });
  console.log('Requested productId:', productId);
  console.log('Matching product:', matchingProduct);
  return matchingProduct;
}

export const products = [
  {
    // COOKWARE
    id: "e43638ce-6aa0-4b85-b27f-e1d07eb678c6",
    image: "assets/images/cookware1.webp",
    category: "Cookware",
    brand: "KITCHENAID" ,
    name: "10-Piece Hard Anodized Ceramic Nonstick Cookware Set",
    rating: {
      stars: 4.5,
      count: 87
    },
    priceCents: 22999,
    keywords: [
      "kitchenaid",
      "cookware",
      "nonstick"
    ]
  },
  {
    id: "15b6fc6f-327a-4ec4-896f-486349e85a3d",
    image: "assets/images/cookware2.webp",
    category: "Cookware",
    brand: "AYSHA CURRY" ,
    name: "Stainless Steel 11-Piece Cookware Set",
    rating: {
      stars: 4,
      count: 127
    },
    priceCents: 14999,
    keywords: [
      "ayesha",
      "cookware set"
    ]
  },
  {
    id: "83d4ca15-0f35-48f5-b7a3-1ea210004f2e",
    image: "assets/images/cookware3.webp",
    category: "Cookware",
    brand: "RACHAEL RAY" ,
    name: "Cucina 12-Piece Nonstick Cookware Set",
    rating: {
      stars: 4.5,
      count: 56
    },
    priceCents: 15999,
    keywords: [
      "cucina",
      "nonstick",
      "cookware set"
    ],   
  },
  {
    id: "54e0eccd-8f36-462b-b68a-8182611d9add",
    image: "assets/images/cookware4.webp",
    category: "Cookware",
    brand: "ANOLON" ,
    name: "cookware set",
    rating: {
      stars: 5,
      count: 2197
    },
    priceCents: 29999,
    keywords: [
      "anolon",
      "kitchen",
      "appliances"
    ]
  },
  {
    id: "3ebe75dc-64d2-4137-8860-1f5a963e534b",
    image: "assets/images/cookware5.jpeg",
    category: "Cookware",
    brand: "LE CREUSET" ,
    name: "Signature French Oven Cerise 28cm",
    rating: {
      stars: 4,
      count: 37
    },
    priceCents: 75000,
    keywords: [
      "french",
      "oven",
      "cerise"
    ]
  },
  {
    id: "8c9c52b5-5a19-4bcb-a5d1-158a74287c53",
    image: "assets/images/cookware6.webp",
    category: "Cookware",
    brand: "LOGGE CAST IRON" ,
    name: "Combo Cooker 26cm (3L)",
    rating: {
      stars: 4.5,
      count: 175
    },
    priceCents: 16900,
    keywords: [
      "cast iron",
      "cookware"
    ]
  },
  {
    id: "dd82ca78-a18b-4e2a-9250-31e67412f98d",
    image: "assets/images/cookware7.webp",
    category: "Cookware",
    brand: "ANOLON" ,
    name: "Anolon Endurance+ Skillet Triple Pack",
    rating: {
      stars: 4.5,
      count: 317
    },
    priceCents: 14900,
    keywords: [
      "anolon",
      "cookware"
    ]
  },
  {
    id: "77919bbe-0e56-475b-adde-4f24dfed3a04",
    image: "assets/images/cookware8.webp",
    category: "Cookware",
    brand: "WOOL DIAMOND" ,
    name: "Induction Frypan & Saute 28cm with Detachable Handle Set 2 Piece",
    rating: {
      stars: 4.5,
      count: 144
    },
    priceCents: 29999,
    keywords: [
      "kitchen",
      "frypan",
      "induction",      
    ]
  },
  {
    id: "3fdfe8d6-9a15-4979-b459-585b0d0545b9",
    image: "assets/images/cookware9.webp",
    category: "Cookware",
    brand: "ESSTEELE PER VITA" ,
    name: "Saucepan Set 3 Piece",
    rating: {
      stars: 4.5,
      count: 305
    },
    priceCents: 26900,
    keywords: [
      "saucepan",
      "set"
    ]
  },

  // BAKEWARE --------------------------------
  {
    id: "58b4fc92-e98c-42aa-8c55-b6b79996769a",
    image: "assets/images/bakeware1.webp",
    category: "Bakeware",
    brand: "AYESHA CURRY" ,
    name: "Nonstick Bakeware Set",
    rating: {
      stars: 4,
      count: 89
    },
    priceCents: 5999,
    keywords: [
      "bakeware",
      "set",
      "nonstick"
    ]
  },
  {
    id: "5968897c-4d27-4872-89f6-5bcb052746d7",
    image: "assets/images/bakeware2.webp",
    category: "Bakeware",
    brand: "AYESHA CURRY" ,
    name: "4-Piece Toaster Oven Baking Set",
    rating: {
      stars: 4.5,
      count: 235
    },
    priceCents: 5999,
    keywords: [
      "toaster",
      "baking",
      "set",
      "ayesha",     
    ],
  },
  {
    id: "aad29d11-ea98-41ee-9285-b916638cac4a",
    image: "assets/images/bakeware3.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "Nonstick Bakeware Set",
    rating: {
      stars: 4.5,
      count: 30
    },
    priceCents: 899,
    keywords: [
      "rachael ray",
      "bakeware",
      "nonstick"
    ]
  },
  {
    id: "04701903-bc79-49c6-bc11-1af7e3651358",
    image: "assets/images/bakeware4.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "Covered Cake Pan & Muffin Pan",
    rating: {
      stars: 4.5,
      count: 562
    },
    priceCents: 3999,
    keywords: [
      "rachael",
      "cake",
      "pan",  
    ]
  },
  {
    id: "901eb2ca-386d-432e-82f0-6fb1ee7bf969",
    image: "assets/images/bakeware5.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "Cucina 10'x15' Crisper Pan Set",
    rating: {
      stars: 4.5,
      count: 232
    },
    priceCents: 2499,
    keywords: [
      "rachael",
      "cucina",
      "pan",  
    ]
  },
  {
    id: "82bb68d7-ebc9-476a-989c-c78a40ee5cd9",
    image: "assets/images/bakeware6.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "2-Piece Nonstick Cookie Pan Set",
    rating: {
      stars: 4,
      count: 160
    },
    priceCents: 2999,
    keywords: [
      "farberware",
      "nonstick",
      "pan", 
    ]
  },
  {
    id: "c2a82c5e-aff4-435f-9975-517cfaba2ece",
    image: "assets/images/bakeware7.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "9'x13' Ceramic Baking Dish",
    rating: {
      stars: 5,
      count: 846
    },
    priceCents: 3999,
    keywords: [
      "farberware",
      "ceramic",
      "baking", 
    ]
  },
  {
    id: "6b07d4e7-f540-454e-8a1e-363f25dbae7d",
    image: "assets/images/bakeware8.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "Lasagna Lover Pan",
    rating: {
      stars: 4,
      count: 99
    },
    priceCents: 3999,
    keywords: [
      "farberware",
      "lasagna",
      "pan", 
    ]
  },
  {
    id: "a82c6bac-3067-4e68-a5ba-d827ac0be010",
    image: "assets/images/bakeware9.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "Oval Baker Set",
    rating: {
      stars: 4,
      count: 215
    },
    priceCents: 4999,
    keywords: [
      "farberware",
      "oval",
      "set", 
    ]
  },
  {
    id: "e4f64a65-1377-42bc-89a5-e572d19252e2",
    image: "assets/images/tabletop1.webp",
    category: "Bakeware",
    brand: "RACHAEL RAY" ,
    name: "Cucina 16-Piece Dinnerware Set",
    page: 2,
    rating: {
      stars: 4.5,
      count: 52
    },
    priceCents: 1799,
    keywords: [
      "jewelry",
      "accessories",
      "womens"
    ]
  },

  // TABLETOP -----------------------------------
  {
    id: "b0f17cc5-8b40-4ca5-9142-b61fe3d98c85",
    image: "assets/images/tabletop1.webp",
    category: "Tabletop",
    brand: "RACHAEL RAY" ,
    name: "Cucina 16-Piece Dinnerware Set",
    rating: {
      stars: 4.5,
      count: 119
    },
    priceCents: 29999,
    keywords: [
      "Cucina",
      "Dinnerware",
      "RACHAEL RAY"
    ]
  },
  {
    id: "a93a101d-79ef-4cf3-a6cf-6dbe532a1b4a",
    image: "assets/images/tabletop2.webp",
    category: "Tabletop",
    brand: "DENBY HALO SPECKLE" ,
    name: "Dinner Set of 12",
    rating: {
      stars: 4.5,
      count: 119
    },
    priceCents: 32400,
    keywords: [
      "Dinner",
      "tabletop",
      "plate"
    ]
  },
  {
    id: "4f4fbcc2-4e72-45cc-935c-9e13d79cc57f",
    image: "assets/images/tabletop3.webp",
    category: "Tabletop",
    brand: "CASERO ORA" ,
    name: "12-Piece Dinner Set White",
    rating: {
      stars: 4,
      count: 326
    },
    priceCents: 15995,
    keywords: [
      "dinner",
      "set",
      "white",
      "plate"
    ]
  },
  {
    id: "8b5a2ee1-6055-422a-a666-b34ba28b76d4",
    image: "assets/images/tabletop4.jpeg",
    category: "Tabletop",
    brand: "ECOLOGY SPECKLE" ,
    name: "Dinner Set Duck Egg",
    rating: {
      stars: 4.5,
      count: 2556
    },
    priceCents: 9995,
    keywords: [
      "dinner",
      "set",      
    ],
  },
  {
    id: "b86ddc8b-3501-4b17-9889-a3bad6fb585f",
    image: "assets/images/tabletop5.webp",
    category: "Tabletop",
    brand: "PORTMEIRION SOPHIE" ,
    name: "Conran 16 Piece Dinner Se",
    rating: {
      stars: 4.5,
      count: 2286
    },
    priceCents: 35500,
    keywords: [
      "conran",
      "dinner ",      
      "kitchen",
      "sophie"
    ]
  },
  {
    id: "19c6a64a-5463-4d45-9af8-e41140a4100c",
    image: "assets/images/tabletop6.webp",
    category: "Tabletop",
    brand: "ROYAL DOULTON" ,
    name: "Pacific Pasta Bowls 22cm (Set of 6)",
    rating: {
      stars: 4,
      count: 456
    },
    priceCents: 13900,
    keywords: [
      "pasta",
      "bowl",
      "doulton",      
    ]
  },
  {
    id: "d2785924-743d-49b3-8f03-ec258e640503",
    image: "assets/images/tabletop7.webp",
    category: "Tabletop",
    brand: "ROYAL DOULTON" ,
    name: "Pacific Cereal Bowls 16cm (Set of 6)",
    rating: {
      stars: 5,
      count: 83
    },
    priceCents: 11800,
    keywords: [
      "cereal",
      "bowl",
      "doulton", 
    ]
  },
  {
    id: "ee1f7c56-f977-40a4-9642-12ba5072e2b0",
    image: "assets/images/tabletop8.webp",
    category: "Tabletop",
    brand: "ROYAL DOULTON" ,
    name: "Pacific Mugs Set 6 Piece",
    rating: {
      stars: 4.5,
      count: 9017
    },
    priceCents: 12500,
    keywords: [
      "set",
      "mug",
      "doulton",
    ]
  },
  {
    id: "1c079479-8586-494f-ab53-219325432536",
    image: "assets/images/tabletop9.webp",
    category: "Tabletop",
    brand: "ROYAL DOULTON" ,
    name: "16 Piece Pacific Lines Dinner Set",
    rating: {
      stars: 4,
      count: 229
    },
    priceCents: 3890,
    keywords: [
      "set",
      "dinner",
      "doulton",
    ]
  },

  // ACCESSORIES -----------------------------------------
  {
    id: "4df68c27-fd59-4a6a-bbd1-e754ddb6d53c",
    image: "assets/images/accessories1.webp",
    category: "Accessories",
    brand: "AYESHA CURRY" ,
    name: "Ceramic 21-Ounce Bacon Grease Jar",
    rating: {
      stars: 3.5,
      count: 42
    },
    priceCents: 4999,
    keywords: [
      "ceramic",
      "jar",
      "ayesha",
      "grease"
    ]
  },
  {
    id: "4e37dd03-3b23-4bc6-9ff8-44e112a92c64",
    image: "assets/images/accessories2.webp",
    category: "Accessories",
    brand: "AYESHA CURRY" ,
    name: "Stainless Steel 3-Piece Nesting Mixing Bowl Set",
    rating: {
      stars: 4.5,
      count: 511
    },
    priceCents: 5999,
    keywords: [
      "Stainless",
      "mixing bowl",
      "ayesha",
      "set"
    ]
  },
  {
    id: "a434b69f-1bc1-482d-9ce7-cd7f4a66ce8d",
    image: "assets/images/accessories3.webp",
    category: "Accessories",
    brand: "AYESHA CURRY" ,
    name: "4-Piece Cooking Utensil Set",
    rating: {
      stars: 4.5,
      count: 130
    },
    priceCents: 2499,
    keywords: [
      "utensil",     
      "ayesha",
      "set"
    ]
  },
  {
    id: "a45cfa0a-66d6-4dc7-9475-e2b01595f7d7",
    image: "assets/images/accessories4.webp",
    category: "Accessories",
    brand: "AYESHA CURRY" ,
    name: "Tool Crock",
    rating: {
      stars: 4.5,
      count: 248
    },
    priceCents: 59.99,
    keywords: [
      "tool",     
      "ayesha",
      "crock"
    ]
  },
  {
    id: "d339adf3-e004-4c20-a120-40e8874c66cb",
    image: "assets/images/accessories5.webp",
    category: "Accessories",
    brand: "RACHAEL RAY" ,
    name: "4-Way Box Grater",
    rating: {
      stars: 4.5,
      count: 117
    },
    priceCents: 4999,
    keywords: [
      "grater",     
      "box",
      "rachael"
    ]
  },
  {
    id: "d37a651a-d501-483b-aae6-a9659b0757a0",
    image: "assets/images/accessories6.webp",
    category: "Accessories",
    brand: "RACHAEL RAY" ,
    name: "6-Piece Tools Set",
    rating: {
      stars: 4,
      count: 126
    },
    priceCents: 2899,
    keywords: [
      "set",     
      "tool",
      "rachael"
    ]
  },
  {
    id: "0d7f9afa-2efe-4fd9-b0fd-ba5663e0a524",
    image: "assets/images/accessories7.webp",
    category: "Accessories",
    brand: "RACHAEL RAY" ,
    name: "2-Piece Evoo Oil And Vinegar Bottle Set",
    rating: {
      stars: 4.5,
      count: 1211
    },
    priceCents: 6900,
    keywords: [
      "set",
      "oil",     
      "bottle",
      "rachael"
    ]
  },
  {
    id: "02e3a47e-dd68-467e-9f71-8bf6f723fdae",
    image: "assets/images/accessories8.webp",
    category: "Accessories",
    brand: "RACHAEL RAY" ,
    name: "Nesting Mixing Bowl Set",
    rating: {
      stars: 4.5,
      count: 363
    },
    priceCents: 4800,
    keywords: [
      "set",
      "mixing bowl",    
      "rachael"
    ]
  },
  {
    id: "8a53b080-6d40-4a65-ab26-b24ecf700bce",
    image: "assets/images/accessories9.webp",
    category: "Accessories",
    brand: "RACHAEL RAY" ,
    name: "6-Piece Knife Block Set",
    rating: {
      stars: 4.5,
      count: 93
    },
    priceCents: 11999,
    keywords: [
      "set",
      "knife",    
      "rachael"
    ]
  },
  {
    id: "10ed8504-57db-433c-b0a3-fc71a35c88a1",
    image: "assets/images/accessories9.webp",
    category: "Accessories",
    brand: "RACHAEL RAY" ,
    name: "6-Piece Knife Block Set",
    rating: {
      stars: 4.5,
      count: 93
    },
    priceCents: 11999,
    keywords: [
      "set",
      "knife",    
      "rachael"
    ]
  },
  //----------------------------------------
  {
    id: "10ed8504-57db-433c-b0a3-fc71a35c88a1",
    image: "images/products/knit-athletic-sneakers-pink.webp",
    name: "Waterproof Knit Athletic Sneakers - Pink",
    rating: {
      stars: 4,
      count: 89
    },
    priceCents: 3390,
    keywords: [
      "shoes",
      "running shoes",
      "footwear",
      "womens"
    ]
  },
  {
    id: "77a845b1-16ed-4eac-bdf9-5b591882113d",
    image: "images/products/countertop-blender-64-oz.jpg",
    name: "Countertop Blender - 64oz, 1400 Watts",
    rating: {
      stars: 4,
      count: 3
    },
    priceCents: 10747,
    keywords: [
      "food blenders",
      "kitchen",
      "appliances"
    ]
  },
  {
    id: "36c64692-677f-4f58-b5ec-0dc2cf109e27",
    image: "images/products/floral-mixing-bowl-set.jpg",
    name: "10-Piece Mixing Bowl Set with Lids - Floral",
    rating: {
      stars: 5,
      count: 679
    },
    priceCents: 3899,
    keywords: [
      "mixing bowls",
      "baking",
      "cookware",
      "kitchen"
    ]
  },
  {
    id: "aaa65ef3-8d6f-4eb3-bc9b-a6ea49047d8f",
    image: "images/products/kitchen-paper-towels-30-pack.jpg",
    name: "2-Ply Kitchen Paper Towels - 30 Pack",
    rating: {
      stars: 4.5,
      count: 1045
    },
    priceCents: 5799,
    keywords: [
      "kitchen",
      "kitchen towels",
      "tissues"
    ]
  },
  {
    id: "bc2847e9-5323-403f-b7cf-57fde044a955",
    image: "images/products/men-cozy-fleece-zip-up-hoodie-red.jpg",
    name: "Men's Full-Zip Hooded Fleece Sweatshirt",
    rating: {
      stars: 4.5,
      count: 3157
    },
    priceCents: 2400,
    keywords: [
      "sweaters",
      "hoodies",
      "apparel",
      "mens"
    ]
  }
];