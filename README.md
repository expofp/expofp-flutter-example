This is an example of how you can integrate ExpoFP maps into an android(Flutter) application.

## Configuring WebView

```js
WebView(
  initialUrl: 'https://developer.expofp.com/examples/autumnfair.html',
  javascriptMode: JavascriptMode.unrestricted,
  javascriptChannels: <JavascriptChannel>{
    JavascriptChannel(
      name: 'onBoothClickHandler',
      onMessageReceived: (JavascriptMessage message) {
        //Some code
      }),
    JavascriptChannel(
      name: 'onFpConfiguredHandler',
      onMessageReceived: (JavascriptMessage message) {
        //Some code
      }),
    JavascriptChannel(
      name: 'onDirectionHandler',
      onMessageReceived: (JavascriptMessage message) {
        //Some code
      }),
  },
  onWebViewCreated: (webViewController) {
    //Some code
  }
)
```
## JavaScript code invocation

Calling up the booth selection function:

```js
webViewController.evaluateJavascript("selectBooth('1306')");
```

Calling the route building function:

```js
webViewController.evaluateJavascript("selectRoute('1306', '2206')");
```
