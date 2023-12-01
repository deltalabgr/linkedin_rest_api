# frozen_string_literal: true

require "test_helper"

class TestLinkedinRestApi < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LinkedinRestApi::VERSION
  end

  def test_image_upload
    at = "AQXKlqDflkygUjNPaJDUYLmLBkooFg5kdOgRhQv2tzsrksv2gbp3YmbWrmusr9JnOng2uWbgKDNQBRY4vrTTFCtKj3Tv9Ymip5wYmqC1bAwzOu6bJFfiACjkBFlR7Ryxe1kJCEBSsfvgQzcOQnSPDtALt5981IsVetrIhcbmPIvgcLnaw9hSHqPF-grhlHKMgTNKRuhFn6tOKfrF3gSUbjRVvk9av6VKIHbecn7j4ADNxZtleslE6_URt3KKDlVTYAStG2ZOMLpeIWQsh76XckHinQnoo5ArkUScpf9oprZUTln5oEC0ssOabRZSuS3-plhySNAOdcmIIEPhNvA8Nc7yVzZypg"

    original_image_url = "https://static.thenounproject.com/png/56852-200.png"
    comment = "This is a test comment"
    media_title = "This is a test media title"

    user = LinkedinRestApi::User.new(at)
    user_info = user.info
    if user_info.code == 200
      assert true
    else
      p user_info
      assert false
    end
    
    # New Image
    img = LinkedinRestApi::Image.new(at, user_info, original_image_url, comment, media_title)

    # Image registration
    image_registration = img.register
    if image_registration.code == 200
      assert true
    else
      p image_registration
      assert false
    end

    # Image upload
    image_upload = img.upload
    if image_upload.code == 201
      assert true
    else
      p image_upload.code
      assert false
    end

    # Image post create
    image_post = img.create_post
    if image_post.code == 201
      assert true
    else
      p image_post.code
      assert false
    end

    assert true
  end
end
