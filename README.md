# POKCheckoutSDK

Pok merchant IOS checkout SDK

### INSTALLATION

Swift Package Manager

```sh
    1) In Xcode, select File > Swift Packages > Add Package Dependency.
    2) use https://github.com/pokpay-ltd/ios-checkout-sdk.git
```

Add deeplink scheme

```sh
    1) Right-click Info.plist, and choose Open As ▸ Source Code.
    2) Copy and paste the following XML snippet into the body of your file ( <dict>...</dict>)

    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>pok-checkoutsdk</string>
            </array>
        </dict>
    </array>
```

### INITIALIZE CHECKOUT

```sh
    POKAuth.instance.proceedPayment(merchantId: merchantId, orderId: orderId)
```
