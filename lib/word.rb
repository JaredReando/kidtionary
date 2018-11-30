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
      @word = normalize_words(attributes[:word])
      @definitions = []
      @definitions.push(normalize_words(attributes[:definition]))
      @word_id = @@kidtionary_id
      @@kidtionary_id += 1

      @@kidtionary.push(self)

    end

    def add_definition(definition)
      normalized_definition = normalize_words(definition)
      @definitions.push(normalized_definition)
    end

    def delete_definition(id)
      @definitions.delete_at(id)
    end

    def normalize_words (one_or_more_words)
      separate_words = one_or_more_words.split(" ")
      separate_words.each_with_index do |word, index|
        if(index == 0)
          word.gsub!(/\W|\d/, "")
          word.capitalize!
        else
          word.gsub!(/\W|\d/, "")
          word.downcase!
        end
      end
      separate_words.join(" ")
    end


  end

# end
