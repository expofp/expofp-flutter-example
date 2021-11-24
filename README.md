This is an example of how you can integrate ExpoFP maps into an android(Flutter) application.

## Configuring WebView

```js
InAppWebView(
    initialUrlRequest: URLRequest(url: Uri.parse('https://developer.expofp.com/examples/autumnfair.html')),
    initialOptions: InAppWebViewGroupOptions(
        android: AndroidInAppWebViewOptions(
            allowFileAccess: true,
            domStorageEnabled: true,
            allowContentAccess: true),
        crossPlatform: InAppWebViewOptions(
            allowUniversalAccessFromFileURLs: true,
            javaScriptEnabled: true,
            allowFileAccessFromFileURLs: true)),
    onConsoleMessage: (InAppWebViewController controller,
        ConsoleMessage consoleMessage) {},
    onWebViewCreated: (InAppWebViewController controller) {
        controller.addJavaScriptHandler(
            handlerName: 'onBoothClick',
            callback: (args) {
                //Some code
            });

        controller.addJavaScriptHandler(
            handlerName: 'onFpConfigured', callback: (args) {
                //Some code
            });

        controller.addJavaScriptHandler(
            handlerName: 'onDirection',
            callback: (args) {
                //Some code
            });
    },
)
```
## JavaScript code invocation

Calling up the booth selection function:

```js
webViewController?.evaluateJavascript(source: "selectBooth($boothName)");
```

Calling the set blue-dot function:

```js
webViewController?.evaluateJavascript(source: "setCurrentPosition($x, $y, $focus)");
```

Calling the route building function:

```js
webViewController?.evaluateJavascript(source: "selectRoute($boothFrom, $boothTo, $exceptUnAccessible)");
```
