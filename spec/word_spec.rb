require('rspec')
require('word')


  describe(Word) do
    describe('#initialize') do
      it("creates a new word.") do
        new_word = Word.new({word: "ham", definition: "pig meat. it come from pigs!!"})
        expect(new_word.word).to(eq("ham"))
      end
    end

    describe('#add_definition') do
      it("adds a definition to an existing word.") do
        new_word = Word.new({word: "ham", definition: "pig meat. it come from pigs!!"})
        new_word.add_definition("a real crack-up in the classroom.")
        expect(new_word.definitions.include?("a real crack-up in the classroom.")).to(eq(true))
      end
    end

  end
