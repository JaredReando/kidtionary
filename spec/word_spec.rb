require('rspec')
require('word')


  describe(Word) do
    describe('#initialize') do
      it("creates a new word.") do
        new_word = Word.new({word: "Ham", definition: "pig meat. it comes from pigs!!"})
        expect(new_word.word).to(eq("Ham"))
      end
    end

    describe('#add_definition') do
      it("adds a definition to an existing word.") do
        new_word = Word.new({word: "Ham", definition: "Pig meat. it comes from pigs!!"})
        new_word.add_definition("A real crack-up in the classroom")
        expect(new_word.definitions.include?("A real crack-up in the classroom")).to(eq(true))
      end
    end

    describe('#delete_definition') do
      it("deletes the selected definition of a word.") do
        new_word = Word.new({word: "Ham", definition: "Pig meat. it comes from pigs!!"})
        new_word.add_definition("A real crack-up in the classroom")
        new_word.delete_definition(1)
        expect(new_word.definitions.include?("A real crack-up in the classroom")).to(eq(false))
      end
    end

    describe('#normalize_words') do
      it("fixes capilization of a string and removes all special characters.") do
        new_word = Word.new({word: "Ham", definition: "p!!ig mEAt. iT cOmEs from pigs!!"})
        expect(new_word.normalize_words(new_word.definitions[0])).to(eq("Pig meat it comes from pigs"))
      end
    end

  end
