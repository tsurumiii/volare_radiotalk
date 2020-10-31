# release
keytool -list -v -keystore android/release.keystore
keytool -exportcert -alias imory_release -keystore android/release.keystore | openssl sha1 -binary | openssl base64
