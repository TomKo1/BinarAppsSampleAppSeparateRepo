require 'test_helper'


class AuthorTest < ActiveSupport::TestCase

    test "name should be present and within range" do 
        # no name
        author = Author.new(surname: 'witam', age: 12)
        assert_not author.valid?
        # too long name
        author = Author.new(name: 'bardzodluganazwaktorajestdluzszaniz20znako123311', surname: 'witam', age: 12)
        assert_not author.valid?
    end

    test "surname should be present and of max length 30" do 
        author = Author.new(name: 'Tomek', age: 20)
        assert_not author.valid?

        author = Author.new(name: 'Tomek', age: 20, surname: 'verylongsurnamewhichislongerthanthirtywordsJustfortesting')
        assert_not author.valid?
    end

    test "Age greater than 150 should not be valid" do 
        author = Author.new(name: 'Tomek', age: 151, surname: 'Kot')
        assert_not author.valid?
    end

    test "Age less than 1 should not be valid" do 
        author = Author.new(name: 'Tomek', age: -1, surname: 'Kot')
        assert_not author.valid?
    end

end