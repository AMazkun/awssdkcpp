# IF YOU WANT TO INSTALL SPECIFIC VERSION
version_to_install="1.11.476"

set -e  # Exit on error

# Remove previous installations to avoid conflicts
rm -rf /usr/local/include/aws
rm -rf /usr/local/include/s2n
rm -rf /usr/local/include/s2n*
rm -rf /usr/local/lib/aws
rm -rf /usr/local/lib/aws*
rm -rf /usr/local/lib/cmake/aws*
rm -rf /usr/local/lib/libaws*
rm -rf /usr/local/lib/libs2n*
rm -rf /usr/local/lib/pkgconfig/aws/*
rm -rf /usr/local/lib/s2n

# Make sure dependencies are installed as developers packets
apt update
apt install build-essential libcurl4-openssl-dev libssl-dev uuid-dev zlib1g-dev libpulse-dev -y

# Clone, build, and install the SDK

rm -rf aws-sdk-cpp
git clone --recurse-submodules -j8 https://github.com/aws/aws-sdk-cpp --branch $version_to_install
#git clone --recurse-submodules -j8 https://github.com/aws/aws-sdk-cpp

mkdir aws-sdk-cpp/build
cd aws-sdk-cpp/build
# After v1.12+ when legacy build will be removed, and the flag -DLEGACY_BUILD=ON may need to be removed
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/local/ \
    -DCMAKE_INSTALL_PREFIX=/usr/local/ \
    -DBUILD_ONLY="core;s3;s3-crt;s3-encryption" \
    -DAUTORUN_UNIT_TESTS=OFF \
    -DLEGACY_BUILD=ON
cmake --build .
cmake --install .
cd ../../
rm aws-sdk-cpp -rf

echo Done installing AWS SDK C++ version $version_to_install
