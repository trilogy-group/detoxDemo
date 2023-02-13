RED='\033[0;31m'
BOLD_YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "\n${BOLD_YELLOW}---- Clearing caches ----${NC}\n"

rm -rf $TMPDIR/react-native-packager-cache-*
rm -rf $TMPDIR/metro-bundler-cache-*

echo -e "\n${BOLD_YELLOW}---- Clearing node_modules ----${NC}\n"

[ -d "./node_modules" ] && rm -R node_modules

# We may revert back by ignoring Pods folders cleanup once we fully
# migrate to upgraded React version.
echo -e "\n${BOLD_YELLOW}---- Clearing Pods ----${NC}\n"

[ -d "./ios/Pods" ] && rm -f -R ./ios/Pods

echo -e "\n${BOLD_YELLOW}---- Cleaning yarn cache ----${NC}\n"

yarn cache clean

echo -e "\n${BOLD_YELLOW}---- Cleaning iOS workspace ----${NC}\n"

xcodebuild clean -workspace ios/detoxTest.xcworkspace -scheme detoxTest

echo -e "\n${BOLD_YELLOW}---- Cleaning Android build folders ----${NC}\n"

[ -d ./android/app/build ] && rm -R android/app/build
[ -d ./android/build ] && rm -R android/build

echo -e "\n${BOLD_YELLOW}---- Installing dependencies ----${NC}\n"

yarn

echo -e "\n${BOLD_YELLOW}---- Installing Pods ----${NC}\n"

cd ios
pod install
cd ..

echo -e "\n${BOLD_YELLOW}---- ALL DONE! ----${NC}\n"

