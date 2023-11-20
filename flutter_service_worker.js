'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "b74effa33567a0cba29d54581a957823",
"index.html": "fe2cdc3872298ebb2787b1af982f79a2",
"/": "fe2cdc3872298ebb2787b1af982f79a2",
"main.dart.js": "702450e4752b669322250453458b1917",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "3b5b2d287218a30a15fcdd2bc9806549",
"icons/Icon-192.png": "bf3addd83f07125f94303ea9248c6869",
"icons/Icon-maskable-192.png": "bf3addd83f07125f94303ea9248c6869",
"icons/Icon-maskable-512.png": "a0424900400ad2cd4551e36b800408b2",
"icons/Icon-512.png": "a0424900400ad2cd4551e36b800408b2",
"manifest.json": "b09e9bd8113cb86a611db2d374fc6edc",
".git/config": "bff59252e305fa8f7f4a1d0e679397af",
".git/objects/0c/bca88584fa4b9cc07332a5a73123b58b5e4cae": "53e509d54b290456fd48887874ea0109",
".git/objects/57/d57cadfac8ec43f474a92c424214cac76b87e2": "e3406e6305adf1c43867d8916fd02d74",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "bf72be4604c984a5ff17ddb852dac423",
".git/objects/35/cf6791f672f0055bfb728d6e65fa76b403fb16": "1cd372a942940b6d97fec8309e1abf9a",
".git/objects/33/98bc3cde55036412b1029bfa7535ddfbbbf755": "d244b3f434d74d8fcb690e419fddbe44",
".git/objects/9d/785c107adcdc878dca4c2ed57d7f1d6a5bf9ff": "104b729cc2ed3c78921927722429e974",
".git/objects/02/015aee07e4e45c9df2b37121b88cc8b4e8b844": "acbe0aee7da7348456ba807e9f092e84",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "e6f06b42748018e79e683bf97d2beb87",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "1020ea7c17300eba0f2921dfe6fff24e",
".git/objects/a5/42cefd7e4b33362553fc3a2ecca8434aff8c24": "aec5f346815a2657566f6be6f9e912c7",
".git/objects/a5/eca7a535a1013dd9af9f577ac55a8309be4c59": "c3aa8cfbb17093af37653119677cc3b9",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "beec33a20a19d6c9a511dc88932ab054",
".git/objects/fd/eb1d0755eaa9dc12a6752d9c14cdf67a1dfb93": "ab9ae87d1f6b7ddfb6ac74925ff07412",
".git/objects/e3/5f48d8af90851a78df01d37df22bbf25a5fdb6": "616d07d0af678727d775d399dd6010b8",
".git/objects/ca/ebe3f7d3a3259aea161689b7d941e55c0bd396": "8a39ce2a1583a11f74a3e78be55555bb",
".git/objects/e4/a344fa8345b088c6a4371b4766caf19234b98d": "a67a9ec28d146bc60fd45be2270d6875",
".git/objects/ed/d6fe47dbb069edfaca3653144256fa475c6425": "576f4aed7b3c39c51041bed2bc59f9c2",
".git/objects/ec/0d30503d7cbf1d7dcc26b12318a1fa6bb0bedc": "8e902643fee5a014eaac2ee064eafb5f",
".git/objects/7c/a260e8b924656fe8cea656b40a1d7b982452c8": "a7689697b1fb0f955d4bccd6f7a4caa4",
".git/objects/8a/7b5dd499a62605ed3b7f1ab69c16bcc3e1c2eb": "052b633f67baed91786f348126e35ac0",
".git/objects/10/cd72b7bb7ac9ee7ee7538babcebc0f0f44e341": "5b4cef7735d6e033de4af969f4dc1c51",
".git/objects/4c/a2a7c226d2c3e26f0b9dde74214486d0baa896": "35207f93ccdbc5de5e18640f46b36217",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "98dc92399f0c19aa26b49bce570be57e",
".git/objects/3f/a2ac2c0f4c1d48ccd5e0330ab8c1978a545d4b": "3b911efea9089a3a66378fa075c80112",
".git/objects/30/3e94e91c31b62777804035364f014c63c30940": "c2e66652d7c77a6779a84b15704ea455",
".git/objects/37/21ff64034cda4d0ee4f8c1f941155b602951c8": "2ccbdad9fd8db9a8b646cc79869eb0bd",
".git/objects/01/bcca7d1c23955f7aeda6a269b1b7f540802096": "3a01ef425b0fc58744da0c6d47637c9c",
".git/objects/0a/1286d9b580d35af1d35307b02fef88cadea24e": "87a6c8357a675b551369a310922fc63f",
".git/objects/d3/5110c617958eb4f61668e09b4cb7214fa5a0d0": "71249b70fb7af6d22b56080d1e7f72b8",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "d5f7a768b78f47b77c5492ef10ea9538",
".git/objects/ba/978591891a5e1d00023f90c1077f9e7d2ce559": "d443eae0c591a14001b306dbf09d5b08",
".git/objects/dc/0cf0fa54182b0b7e8dfb283562cf1cca1c032a": "f5e58b09aebfd47a20f0b4604e62a977",
".git/objects/dc/508baf399cfbea32f51b9542fe69f91cfae884": "32bd74a0b35702588e7b68155321149b",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "294a7b35d4d4988884b36a893e1c0a8c",
".git/objects/af/60248332a3f56169ba189a7097d15f617ea19e": "7e821e0059a97ca23834d8ee5957bbb0",
".git/objects/a8/234e78324011301c932efde8dd789fba10495a": "ece6a0ff9a24a8f64dc6ea097b41ed92",
".git/objects/a6/1ab44b197943810b7d0d52f3791df444637012": "79a57b4aead154a05bde852fc548feb0",
".git/objects/c4/e180f1bf395a2443dc2b1aaf1c2687a6a225ee": "11f7669680e97dcef096765a47b7a373",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "6078dfba0d9dfa654b1e692f5dc30d82",
".git/objects/e8/55dc987b0db3ccd24a8869a087233a0e124f27": "d6e1364da0c48871bc1f4aa1ec5acdcd",
".git/objects/2c/c28264fdefeb27e2776562ef81aee666cafb7c": "5d987c086cfd642239bdf6bbb2394c17",
".git/objects/83/0e3d19e7f2ff19bbb4b955e3a38e3328837e12": "24a55a55a467d7195b6eb59c4f31d32d",
".git/objects/48/c66746592ee2b67be98e4a653626ab21df822c": "b05b72d12bfa16a3b047976072fdbac4",
".git/objects/8c/1eba55b130011a250f1b88027093663807f1a6": "99e2106a09ed096b7ff98e3445538ded",
".git/objects/1c/140e89a2d8a81a4340a108149df0d532c40786": "b2e58e5c327ce9860b709f48ce1aed82",
".git/objects/82/e05368fb72e8a3d0ebc4e1a62d7de2beaec913": "14ad7eb2880d55311c97bb814242c7bc",
".git/objects/22/2198e5b658e52b1e8392fa85f81b5b0ad89699": "f8f5e768f4ef89c05f64728257742ef2",
".git/objects/25/4483249d9759b6b16f1ef4ec81ceba8fac091e": "0c404692c448aadf96e455d9a96b73b1",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "725c1e83ca31f0d2be220ea7c170c9ef",
".git/logs/refs/heads/gh-pages": "725c1e83ca31f0d2be220ea7c170c9ef",
".git/logs/refs/remotes/origin/gh-pages": "60873e3467af4607406fa067a11c405b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "7204993c63b55e788b9c1f73b8b61d73",
".git/refs/remotes/origin/gh-pages": "7204993c63b55e788b9c1f73b8b61d73",
".git/index": "238fbf82505c61adcccc4556340b3bce",
".git/COMMIT_EDITMSG": "01eb2c11c2685e04a0e3b0556549b914",
"assets/AssetManifest.json": "77ba876bab07a21910142da9734f83e5",
"assets/NOTICES": "85aabcc36865907f05170d604469933e",
"assets/FontManifest.json": "f668bc84d7d6b4ba21b5ba4bf342709d",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "3759b2f7a51e83c64a58cfe07b96a8ee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "3d3a1c16da8f028c58eb3ceeafefced1",
"assets/fonts/MaterialIcons-Regular.otf": "4a605f5da94f25c87a21ab9601e256e1",
"assets/assets/fonts/Maplestory_OTF_Light.otf": "843488aa25de79c2ea60a4ae25171c21",
"assets/assets/fonts/Maplestory_OTF_Bold.otf": "72eef940aa8a20d053708b12057a7a09",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
