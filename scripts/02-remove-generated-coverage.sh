#!/bin/sh
lcov --remove coverage/lcov.info "*.gr.dart" "*.g.dart" "generated_plugin_registrant.dart" "*.part.dart" "*/models/session_info.dart" "*/models/actor_details.dart" -o coverage/lcov.info