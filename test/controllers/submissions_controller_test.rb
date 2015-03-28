require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  # submissions#vote
  test "allow users to vote" do
    user = users(:user)
    submission = submissions(:submission)
    sign_in user
    assert_difference "Submission.find(#{submission.id}).votes", 1, "Failed to record vote" do
      put :vote, id: submission.id
    end
  end

  test "deny voting twice" do
    user = users(:user)
    submission = submissions(:submission)
    sign_in user
    assert_difference "Submission.find(#{submission.id}).votes", 1, "Allowed duplicate vote" do
      put :vote, id: submission.id
      put :vote, id: submission.id
    end
  end

  test "deny voting on nonfeatured code" do
    user = users(:user)
    submission = submissions(:old_submission)
    sign_in user
    assert_no_difference "Submission.find(#{submission.id}).votes", "Allowed vote for nonfeatured submission" do
      put :vote, id: submission.id
    end
  end
end
