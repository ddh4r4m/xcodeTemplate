# load("@rules_cc//cc:defs.bzl", "objc_library")
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

# load(
#     "@rules_xcodeproj//xcodeproj:defs.bzl",
#     "top_level_target",
#     "xcodeproj",
# )

# objc_library(
#     name = "UrlGetClasses",
#     srcs = [
#         "UrlGet/AppDelegate.m",
#         "UrlGet/UrlGetViewController.m",
#         "UrlGet/main.m",
#     ],
#     hdrs = glob(["UrlGet/*.h"]),
# )

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
    deps = ["//Pods/Alamofire"],
    tags = ["manual"],
    visibility = ["//visibility:public"],
)

# swift_library(
#     name = "sources",
#     module_name = "xcodeSample",
#     srcs= glob(["**/*.swift"]),
#     deps = ["//Pods/Alamofire"],
#     copts = [ "-DBAZELBUILD"]
# )

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

# xcodeproj(
#     name = "xcodeproj",
#     build_mode = "bazel",
#     project_name = "xcodeSample",
#     tags = ["manual"],
#     top_level_targets = [
#         top_level_target(
#             ":xcodeSample",
#             target_environments = ["device", "simulator"],
#         ),
#     ],
# )