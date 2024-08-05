#!/bin/bash

echo -e
echo 'Applying patches...'
echo -e
echo 'Applying patches to vendor/aospa'
echo -e
cd vendor/aospa
git reset --hard FETCH_HEAD
echo -e
git am ../../device/sony/pdx215/configs/patches/vendor_aospa/0001-products-Introduce-Sony-Xperia-1-III-pdx215.patch
cd ../..
echo -e
echo 'Done Applying all Patches!'
echo -e