#!/bin/bash

set -e

# TODO(https://github.com/envoyproxy/nighthawk/issues/165): fully excluding everything
# from the build fixer isn't ideal.
bazel run @envoy//tools:code_format/check_format.py -- \
  --skip_envoy_build_rule_check  --namespace_check Nighthawk \
  --build_fixer_check_excluded_paths=$(realpath ".") \
  --include_dir_order envoy,nighthawk,external/source/envoy,external,api,common,source,exe,server,client,test_common,test \
  $1 $PWD

bazel run //tools:check_envoy_includes.py
