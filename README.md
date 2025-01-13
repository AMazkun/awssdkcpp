# awssdkcpp
AWS SDK C++ installation script Ubuntu

if you having proplems with building and installing AWS C++ SDK, may be have to reinstall developers packets before
Here an example how partually to install complete S3 framework

Not remove souces at once if you are not sure the cope of libreries, just simply you can add nopt installed library part after

cmake
...
-DBUILD_ONLY="<here put missed libraries names ; - is separator>"
