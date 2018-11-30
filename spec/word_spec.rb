require('rspec')
require('word')


  describe(Word) do
    describe('#initialize') do
      it("creates a new word.") do
        new_word = Word.new({word: "ham", definition: "pig meat. it come from pigs!!", part_of_speech: "noun"})
        expect(new_word.part_of_speech).to(eq("noun"))
      end
    end

    describe('#add_definition') do
      it("adds a definition to an existing word.") do
        new_word = Word.new({word: "ham", definition: "pig meat. it come from pigs!!", part_of_speech: "noun"})
        new_word.add_definition("a real crack-up in the classroom.", "noun")
        expect(new_word.definition.includes?("a real crack-up in the classroom.")).to(eq(true))
      end
    end

  end
