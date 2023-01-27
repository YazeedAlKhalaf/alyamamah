#!/bin/sh
lcov --remove coverage/lcov.info "*.gr.dart" "*.g.dart" "generated_plugin_registrant.dart" "*.part.dart" -o coverage/lcov.info