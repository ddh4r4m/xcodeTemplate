load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "SwiftLibrary",
    srcs = glob([
        "*.swift",
        "**/*.swift"
    ]),
    data = glob([
        "*.xcassets/**/*",
        "*.lproj/**/*",
    ]),
    module_name = "xcodeSample",
    deps = ["//Pods/Alamofire", "//Pods/SnapKit"],
    tags = ["manual"],
    visibility = ["//visibility:public"],
)

ios_application(
    name = "xcodeSample",
    bundle_id = "com.ddhr4m.xcodesample.xcodeSample",
    families = [
        "iphone"
    ],
    infoplists = [":Info.plist"],
    # launch_storyboard = "UrlGet/UrlGetViewController.xib",
    minimum_os_version = "13.0",
    # provisioning_profile = "<your_profile_name>.mobileprovision", # Uncomment and set your own profile.
    visibility = ["//visibility:public"],
    deps = [":SwiftLibrary"],
)
