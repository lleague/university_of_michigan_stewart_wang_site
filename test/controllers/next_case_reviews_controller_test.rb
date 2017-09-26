require 'test_helper'

class NextCaseReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @next_case_review = next_case_reviews(:one)
  end

  test "should get index" do
    get next_case_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_next_case_review_url
    assert_response :success
  end

  test "should create next_case_review" do
    assert_difference('NextCaseReview.count') do
      post next_case_reviews_url, params: { next_case_review: {  } }
    end

    assert_redirected_to next_case_review_url(NextCaseReview.last)
  end

  test "should show next_case_review" do
    get next_case_review_url(@next_case_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_next_case_review_url(@next_case_review)
    assert_response :success
  end

  test "should update next_case_review" do
    patch next_case_review_url(@next_case_review), params: { next_case_review: {  } }
    assert_redirected_to next_case_review_url(@next_case_review)
  end

  test "should destroy next_case_review" do
    assert_difference('NextCaseReview.count', -1) do
      delete next_case_review_url(@next_case_review)
    end

    assert_redirected_to next_case_reviews_url
  end
end
