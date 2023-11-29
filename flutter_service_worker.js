'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "b74effa33567a0cba29d54581a957823",
"index.html": "ccc35cdd6083271356710fbb5658ef61",
"/": "ccc35cdd6083271356710fbb5658ef61",
"main.dart.js": "f7d26bd17aa65e92ad28c964d4b1564b",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "3b5b2d287218a30a15fcdd2bc9806549",
"icons/Icon-192.png": "bf3addd83f07125f94303ea9248c6869",
"icons/Icon-maskable-192.png": "bf3addd83f07125f94303ea9248c6869",
"icons/Icon-maskable-512.png": "a0424900400ad2cd4551e36b800408b2",
"icons/Icon-512.png": "a0424900400ad2cd4551e36b800408b2",
"manifest.json": "b09e9bd8113cb86a611db2d374fc6edc",
".git/config": "bff59252e305fa8f7f4a1d0e679397af",
".git/objects/0c/bca88584fa4b9cc07332a5a73123b58b5e4cae": "53e509d54b290456fd48887874ea0109",
".git/objects/66/3ebd457765226d2fede05c5e13fdd40fb12a09": "80db626db16209e10f1f2df07b1cc670",
".git/objects/57/d57cadfac8ec43f474a92c424214cac76b87e2": "e3406e6305adf1c43867d8916fd02d74",
".git/objects/57/afe084a2f21c712b53f1d51edec7e45e955048": "bb785886d206081d09c8095aa88492ec",
".git/objects/6a/6f20bc3573211e328926b7111302212d7c621c": "58e19f448bb0d82be170aaeb16036249",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "bf72be4604c984a5ff17ddb852dac423",
".git/objects/35/cf6791f672f0055bfb728d6e65fa76b403fb16": "1cd372a942940b6d97fec8309e1abf9a",
".git/objects/3c/2fc5709087b9063588fc632e562a763759d14c": "d7268e1ad69c0ae61b17281ac1662a83",
".git/objects/56/5404dba2ee6b70cb5a62eb933e7e72809338b6": "1ea94d0885ccf4d0f3766fbf1077ff68",
".git/objects/94/a61a9f3d70ec7c55c627cb8e4b769e79b3b06d": "3be3c428ae0cc43504d748633cb6f45e",
".git/objects/60/567ca43c26c7e9b974d0bd230b900b6fc3fd82": "0f0945353414b7f68ab56711d2511d31",
".git/objects/33/98bc3cde55036412b1029bfa7535ddfbbbf755": "d244b3f434d74d8fcb690e419fddbe44",
".git/objects/9d/785c107adcdc878dca4c2ed57d7f1d6a5bf9ff": "104b729cc2ed3c78921927722429e974",
".git/objects/02/015aee07e4e45c9df2b37121b88cc8b4e8b844": "acbe0aee7da7348456ba807e9f092e84",
".git/objects/a4/8ad3d1fba73aa619a8669b30adc86f95612805": "2daf088edebd1642d00dbb5e6a47f34e",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "e6f06b42748018e79e683bf97d2beb87",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "1020ea7c17300eba0f2921dfe6fff24e",
".git/objects/b3/a01a4e20e32acb8e4bfc56f1361fa5bc064282": "17951c0015b9c9d937d1037e220084d7",
".git/objects/a5/42cefd7e4b33362553fc3a2ecca8434aff8c24": "aec5f346815a2657566f6be6f9e912c7",
".git/objects/a5/eca7a535a1013dd9af9f577ac55a8309be4c59": "c3aa8cfbb17093af37653119677cc3b9",
".git/objects/d1/1f99d9115cae91c383f1f181156124e0d0792d": "4ecb7ab8d83edbd732d0503b316dc998",
".git/objects/d6/40e0260dd891216dc77d176c0b796a21b7b312": "6fbcf70556b6c3031ca38bcfdeeca525",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "beec33a20a19d6c9a511dc88932ab054",
".git/objects/fd/eb1d0755eaa9dc12a6752d9c14cdf67a1dfb93": "ab9ae87d1f6b7ddfb6ac74925ff07412",
".git/objects/e3/5f48d8af90851a78df01d37df22bbf25a5fdb6": "616d07d0af678727d775d399dd6010b8",
".git/objects/cf/20b5efc08ab299bb403ff9fe453d78c32c7f24": "833d3db7c0c1b1378c9b67c1f97d05a6",
".git/objects/ca/ebe3f7d3a3259aea161689b7d941e55c0bd396": "8a39ce2a1583a11f74a3e78be55555bb",
".git/objects/ca/3404efa0c444e1874fadd478a9a830cc5c1944": "93952d5fcac516effda29b3e6ce03826",
".git/objects/e4/a344fa8345b088c6a4371b4766caf19234b98d": "a67a9ec28d146bc60fd45be2270d6875",
".git/objects/e4/96781566e7428ef160fce72800606c3761f1db": "b4db42d9b3d953d2a40fbc0ca389cff8",
".git/objects/ed/d6fe47dbb069edfaca3653144256fa475c6425": "576f4aed7b3c39c51041bed2bc59f9c2",
".git/objects/ec/0d30503d7cbf1d7dcc26b12318a1fa6bb0bedc": "8e902643fee5a014eaac2ee064eafb5f",
".git/objects/27/45f7a62ec296c00752080b9011883172b55bb2": "c44ac6e4da1789bfcb5d574f23a5c457",
".git/objects/4b/d035ae7572cbd44f3ded184b6d84d6a2ff430f": "f7b87ac49bafd112c5abe18e35b32072",
".git/objects/7c/a260e8b924656fe8cea656b40a1d7b982452c8": "a7689697b1fb0f955d4bccd6f7a4caa4",
".git/objects/16/0c81dcd9abe18b2c7549f6a49978e7064c114c": "1ea7aaf6ec8a88325c308710ba2a7e2d",
".git/objects/8a/7b5dd499a62605ed3b7f1ab69c16bcc3e1c2eb": "052b633f67baed91786f348126e35ac0",
".git/objects/10/cd72b7bb7ac9ee7ee7538babcebc0f0f44e341": "5b4cef7735d6e033de4af969f4dc1c51",
".git/objects/19/cf9c7f032877a31284167d94d19c40227dc241": "4121e26510ca603f31e1ac31daa0b26d",
".git/objects/4c/12b8432019156e0b133dc08d05bfc4381840aa": "b4a2ea4a5c5441f2e3b9afddc55f4314",
".git/objects/4c/a2a7c226d2c3e26f0b9dde74214486d0baa896": "35207f93ccdbc5de5e18640f46b36217",
".git/objects/4d/a1f8202ee462fd748643b50a0e6b14272b4c40": "adaee45a428d40d025ca7039b9fd8c69",
".git/objects/75/f59d14a080878933a020406ecf403fa2750c58": "38449565faccc511ec61a703141c0464",
".git/objects/36/cd7f86bd6cfd72fbc04f19f7d1a62c35409299": "1485f20a69f1b4eafe70b9e2b3a10624",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "98dc92399f0c19aa26b49bce570be57e",
".git/objects/3f/30f5fe179c111faa70b0aed999b61fbebd4aa4": "cccaa4d4f5db25a64bf1e183c0a36bf9",
".git/objects/3f/a2ac2c0f4c1d48ccd5e0330ab8c1978a545d4b": "3b911efea9089a3a66378fa075c80112",
".git/objects/30/3e94e91c31b62777804035364f014c63c30940": "c2e66652d7c77a6779a84b15704ea455",
".git/objects/37/21ff64034cda4d0ee4f8c1f941155b602951c8": "2ccbdad9fd8db9a8b646cc79869eb0bd",
".git/objects/08/37bce25968afb5563cd1019d4886126c87d06e": "d2e0b841109402512ec0fc7e3a4bcab6",
".git/objects/01/bcca7d1c23955f7aeda6a269b1b7f540802096": "3a01ef425b0fc58744da0c6d47637c9c",
".git/objects/0a/1286d9b580d35af1d35307b02fef88cadea24e": "87a6c8357a675b551369a310922fc63f",
".git/objects/d3/5110c617958eb4f61668e09b4cb7214fa5a0d0": "71249b70fb7af6d22b56080d1e7f72b8",
".git/objects/d3/6caf4e138eeac3a21f3ba04001431a7024b510": "11eb077d35f7e5d4566f8d0f27a44186",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "d5f7a768b78f47b77c5492ef10ea9538",
".git/objects/ba/978591891a5e1d00023f90c1077f9e7d2ce559": "d443eae0c591a14001b306dbf09d5b08",
".git/objects/b8/867bc302cf7d1a9df015f1a73f7ed1635f44b6": "92c499e7cb82186d78148aa90b65ec4b",
".git/objects/b8/effbf9fd88891ad3236af70544495800c98e07": "4cba3860b06ee8beb7a9ec76499155a7",
".git/objects/dc/0cf0fa54182b0b7e8dfb283562cf1cca1c032a": "f5e58b09aebfd47a20f0b4604e62a977",
".git/objects/dc/508baf399cfbea32f51b9542fe69f91cfae884": "32bd74a0b35702588e7b68155321149b",
".git/objects/b6/5f9033e87888d72429bbc555e9f3f335b765bc": "40ce046274686944dac7aa622ec1b49d",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "294a7b35d4d4988884b36a893e1c0a8c",
".git/objects/af/60248332a3f56169ba189a7097d15f617ea19e": "7e821e0059a97ca23834d8ee5957bbb0",
".git/objects/a8/234e78324011301c932efde8dd789fba10495a": "ece6a0ff9a24a8f64dc6ea097b41ed92",
".git/objects/a6/1ab44b197943810b7d0d52f3791df444637012": "79a57b4aead154a05bde852fc548feb0",
".git/objects/c4/e180f1bf395a2443dc2b1aaf1c2687a6a225ee": "11f7669680e97dcef096765a47b7a373",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "6078dfba0d9dfa654b1e692f5dc30d82",
".git/objects/e8/55dc987b0db3ccd24a8869a087233a0e124f27": "d6e1364da0c48871bc1f4aa1ec5acdcd",
".git/objects/c5/6a518e0991b572cf7b5993c46c4072f308c683": "ebaa8b5deb272e86e7727fc3df32c034",
".git/objects/e9/8fb75f5ad2862bbbc6ae1cbd411be8b4a0e38b": "2a553821147fc2a064c784f4949c217b",
".git/objects/f8/9c46b6b5378d458675bfeb5f51b87c96743ee3": "01383fdcaa53dd79664b30889f398f4b",
".git/objects/2c/c28264fdefeb27e2776562ef81aee666cafb7c": "5d987c086cfd642239bdf6bbb2394c17",
".git/objects/83/0e3d19e7f2ff19bbb4b955e3a38e3328837e12": "24a55a55a467d7195b6eb59c4f31d32d",
".git/objects/77/95f2690d63aa866a2f8ea9e353547704027af6": "5a9fa8d757a37fee356c2d4d87fd97dd",
".git/objects/48/c66746592ee2b67be98e4a653626ab21df822c": "b05b72d12bfa16a3b047976072fdbac4",
".git/objects/4a/bafc2c27899311b675e58aa03428cae701283e": "f0ac4e6babf4a00853e9ff9faed44dfb",
".git/objects/24/62cd22a409d31915ee3edddfdc3fb530d7e6bb": "771a085909e53d912affa38f5e11532d",
".git/objects/4f/9bf1d13e51c9de70b26a0ac167f41faf54e7df": "fdfafd5cd6cca9c0d59219f5f9d8e76b",
".git/objects/8c/1eba55b130011a250f1b88027093663807f1a6": "99e2106a09ed096b7ff98e3445538ded",
".git/objects/1c/140e89a2d8a81a4340a108149df0d532c40786": "b2e58e5c327ce9860b709f48ce1aed82",
".git/objects/82/e05368fb72e8a3d0ebc4e1a62d7de2beaec913": "14ad7eb2880d55311c97bb814242c7bc",
".git/objects/8e/5285ceef8e8b0a06a0fa0b8da51304d9ed847b": "ed036631753675d9c3dd7bdf0b679769",
".git/objects/22/2198e5b658e52b1e8392fa85f81b5b0ad89699": "f8f5e768f4ef89c05f64728257742ef2",
".git/objects/25/4483249d9759b6b16f1ef4ec81ceba8fac091e": "0c404692c448aadf96e455d9a96b73b1",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "7d7659f054bce370fea20a96818bb8bf",
".git/logs/refs/heads/gh-pages": "7d7659f054bce370fea20a96818bb8bf",
".git/logs/refs/remotes/origin/gh-pages": "ac3880fbbaab49d889eb5416121b8b80",
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
".git/refs/heads/gh-pages": "9673a6e7c9aa74326fcef4e311918c0b",
".git/refs/remotes/origin/gh-pages": "9673a6e7c9aa74326fcef4e311918c0b",
".git/index": "a5e38f49d90cbb959412422d9eb54a86",
".git/COMMIT_EDITMSG": "01eb2c11c2685e04a0e3b0556549b914",
"assets/AssetManifest.json": "10b00962ba1949b5fb71a5d1cfc704cb",
"assets/NOTICES": "f4a853b521c79dc21d1030923a3eeca8",
"assets/FontManifest.json": "f668bc84d7d6b4ba21b5ba4bf342709d",
"assets/AssetManifest.bin.json": "e04051a5227f21a7a083c53816606f1d",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "3759b2f7a51e83c64a58cfe07b96a8ee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "2ef3848ab554fe428ca305461ae86e52",
"assets/fonts/MaterialIcons-Regular.otf": "4a605f5da94f25c87a21ab9601e256e1",
"assets/assets/images/jewel/jewel_1.png": "0248b8bb4a7b548910b3e71853895a36",
"assets/assets/images/jewel/jewel_2.png": "d3522457f7bb5145b6a7161aa7b70cb0",
"assets/assets/images/effect/bullet16/purple16x16.png": "a2dd1b0b5ec4847c772204febc8162b4",
"assets/assets/images/effect/bullet16/red16x16.png": "7675df77571329cba3b77591b60c108d",
"assets/assets/images/effect/bullet16/ice16x16.png": "b1ab0e76677094b6ad7978e4bc305546",
"assets/assets/images/effect/bullet16/green16x16.png": "e6fd33d5a18297f068ea6508a8cd8802",
"assets/assets/fonts/Maplestory_OTF_Light.otf": "843488aa25de79c2ea60a4ae25171c21",
"assets/assets/fonts/Maplestory_OTF_Bold.otf": "72eef940aa8a20d053708b12057a7a09",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
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
