load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "2a0a35c9f72a0b0ac9238ecb081b0da4bb3e9739e25d2a910cc6b4c4425c01be",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/2.4.1/rules_apple.2.4.1.tar.gz",
)

http_archive(
    name = "build_bazel_rules_ios",
    sha256 = "7ef26dfff0220114e060ed0d4866a2c9c7387c5e918cc33bb1396095efd1f4c0",
    url = "https://github.com/bazel-ios/rules_ios/releases/download/1.1.0/rules_ios.1.1.0.tar.gz",
)

load(
    "@build_bazel_rules_ios//rules:repositories.bzl",
    "rules_ios_dependencies"
)

rules_ios_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "3a595a64afdcaf65b74b794661556318041466d727e175fa8ce20bdf1bb84ba0",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.10.0/rules_swift.1.10.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load(
    "@com_google_protobuf//:protobuf_deps.bzl",
    "protobuf_deps",
)

protobuf_deps()

http_archive(
    name = "bazelpods",
    sha256 = "0b3c51f3347ee1fd977e3491387eabf1381e076850024a9e791ed23895184adf",
    strip_prefix = "BazelPods-0.10.0",
    url = "https://github.com/sergeykhliustin/BazelPods/archive/refs/tags/0.10.0.tar.gz"
)

load("@bazelpods//:repositories.bzl", "bazelpods_dependencies")

bazelpods_dependencies()