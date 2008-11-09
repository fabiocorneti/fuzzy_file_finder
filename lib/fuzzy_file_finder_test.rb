require 'fuzzy_file_finder'
require 'test/unit'

class FuzzyFileFinderTest < Test::Unit::TestCase

  def test_find
    finder = FuzzyFileFinder.new
    results = finder.find("hml", 200)
    assert_equal(results[0][:abbr], 'a/b/index.(h)t(ml)')
    assert_equal(results[1][:abbr], 'a/b/l/c/t/comment.(h)t(ml)')
    assert_equal(results[2][:abbr], 'a/b/l/c/t/index.(h)t(ml)')
    assert_equal(results[3][:abbr], 'a/b/l/p/t/index.(h)t(ml)')
    assert_equal(results[4][:abbr], 'a/b/l/s/t/index.(h)t(ml)')
    assert_equal(results[5][:abbr], 'a/c/b/index.(h)t(ml)')
    assert_equal(results[6][:abbr], 'a/index.(h)t(ml)')
  end

  def test_disambiguation
    finder = FuzzyFileFinder.new
    results = finder.find("hml", 200, true)
    assert_equal(results[0][:abbr], 'apptest/blog/index.(h)t(ml)')
    assert_equal(results[1][:abbr], 'a/b/l/c/t/comment.(h)t(ml)')
    assert_equal(results[2][:abbr], 'a/b/l/comment/templates/index.(h)t(ml)')
    assert_equal(results[3][:abbr], 'a/b/l/post/templates/index.(h)t(ml)')
    assert_equal(results[4][:abbr], 'a/b/l/spam/templates/index.(h)t(ml)')
    assert_equal(results[5][:abbr], 'a/clone/blog/index.(h)t(ml)')
    assert_equal(results[6][:abbr], 'apptest/index.(h)t(ml)')
  end

end
