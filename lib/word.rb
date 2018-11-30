# module Record
  class Word

    @@kidtionary = []
    @@kidtionary_id = 0

    def self.show_all_words
      @@kidtionary
    end

    def self.word_search (word_id)
      @@kidtionary[word_id]
    end

    def self.delete_word (word_id)
      @@kidtionary.delete_at(word_id)
      self.assign_word_ids
    end

    def self.assign_word_ids
      if(@@kidtionary != [])
        @@kidtionary.each_with_index do |word, index|
          word.word_id = index
        end
      end
    end

    attr_accessor :word, :definitions, :word_id

    def initialize(attributes)
      @word = attributes[:word]
      @definitions = []
        # if(attributes.key?()[:definition]
        # if the word has a definition in its hash, it is added via "push", otherwise code does not run
        # end
      @definitions.push(attributes[:definition])
      @word_id = @@kidtionary_id
      @@kidtionary_id += 1

      @@kidtionary.push(self)

    end

    def add_definition(definition)
      @definitions.push(definition)
    end

    def delete_definition(id)
      @definitions.delete_at(id)
    end


  end

# end
