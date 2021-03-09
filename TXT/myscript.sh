#!/bin/bash
# Bintang Dominique
# Tue 09 Mar 2021 18:37:15 AM WIB

# Set files

FILES="my*.txt my*.sh"
SHA="SHA256SUM"

# Remove unnecessary files

echo "rm -f $SHA $SHA.asc"
rm -f $SHA $SHA.asc

# Generate checksum

echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA

# Verify

echo "sha256sum -c $SHA"
sha256sum -c $SHA

# Sign my shasum file, and put it into armored ascii

echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA

# Verify sign by me

echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA

exit 0
