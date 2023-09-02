# xcodeTemplate
An Xcode Project Template with pods initialised to get going with project

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)    
    window.rootViewController = ViewController() // Your initial view controller.
    window.makeKeyAndVisible()
    self.window = window
    return true
}
```

## Bazel 

### Building 
❯ bazel build //xcodeSample:xcodeSample

### Running
❯ bazel run //xcodeSample:xcodeSample