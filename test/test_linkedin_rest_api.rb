# frozen_string_literal: true

require "test_helper"

class TestLinkedinRestApi < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LinkedinRestApi::VERSION
  end

  def test_image_upload
    at="AQXKlqDflkygUjNPaJDUYLmLBkooFg5kdOgRhQv2tzsrksv2gbp3YmbWrmusr9JnOng2uWbgKDNQBRY4vrTTFCtKj3Tv9Ymip5wYmqC1bAwzOu6bJFfiACjkBFlR7Ryxe1kJCEBSsfvgQzcOQnSPDtALt5981IsVetrIhcbmPIvgcLnaw9hSHqPF-grhlHKMgTNKRuhFn6tOKfrF3gSUbjRVvk9av6VKIHbecn7j4ADNxZtleslE6_URt3KKDlVTYAStG2ZOMLpeIWQsh76XckHinQnoo5ArkUScpf9oprZUTln5oEC0ssOabRZSuS3-plhySNAOdcmIIEPhNvA8Nc7yVzZypg"

    user = LinkedinRestApi::User.new(at)
    user_info = user.info
    if user_info.code == 200
      assert true
    else
      p user_info
      assert false
    end
    
    img = LinkedinRestApi::Image.new(at, user_info)
    image_register = img.register
    assert false unless image_register.code == 200
    assert true
  end
end
