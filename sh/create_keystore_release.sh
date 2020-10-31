# release
keytool -genkey -v -keystore android/release.keystore -alias imory_release -keyalg RSA -validity 10000

# https://cpoint-lab.co.jp/article/201803/1757/ keystore check
keytool -list -v -keystore android/release.keystore

# Base64 for release.keystore
keytool -exportcert -alias alias_name -keystore android/release.keystore | openssl sha1 -binary | openssl base64

# Base64 for GooglePlay Sha 1
#echo 00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00 | xxd -r -p | openssl base64