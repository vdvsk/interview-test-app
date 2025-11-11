Setup
1. Clone the repo
2. Open the project
3. Add your JSONBin key
Open the file:
TestAppInterview/Config/Secret.xcconfig
and replace the placeholder:
JSONBIN_ACCESS_KEY = put_your_key_here
with your real JSONBin API key.
The key is automatically passed to Info.plist and accessed via:
Secrets.jsonbinAccessKey
