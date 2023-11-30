# frozen_string_literal: true

require 'dotenv/load'

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "linkedin_rest_api"

require "minitest/autorun"

require 'minitest/color'
# require 'minitest/pride'
