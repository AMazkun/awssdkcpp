# AWS sdk C++

## AWS SDK C++ Installation Script for Ubuntu

If you are having problems with building and installing the AWS C++ SDK, you may need to reinstall the developer packages first. 

Here is an example of how to partially install the complete S3 framework:

Do not remove the sources at once if you are not sure about the scope of the libraries. Simply add the not installed library parts after:

```bash
cmake \
-DBUILD_ONLY="<here put missed libraries names where ';' - is separator>"
