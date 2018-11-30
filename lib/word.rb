# module Record
  class Word

    @@kidtionary = []

    def self.show_all_contacts
      @@contact_list
    end

    def self.find_contact (contact_id)
      @@contact_list[contact_id]
    end

    def self.delete_contact (contact_id)
      @@contact_list.delete_at(contact_id)
      self.assign_contact_ids
    end

    def self.assign_contact_ids
      if(@@contact_list != [])
        @@contact_list.each_with_index do |contact, index|
          contact.contact_id = index
        end
      end
    end

    attr_reader :first_name, :last_name, :job_title, :company, :contact_type, :addresses
    attr_accessor :contact_id

    def initialize(attributes)
      ## also @@frist_name = attributes.fetch(:first_name)
      @first_name = attributes[:first_name]
      @last_name = attributes[:last_name]
      @job_title = attributes[:job_title]
      @company = attributes[:company]
      @contact_type = attributes[:contact_type]
      @contact_id = @@contact_list.length
      @definitions = []

      @@contact_list.push(self)

    end

    def full_name
      @first_name + " " + @last_name
    end

    def add_address(attributes)
      @addresses.push(attributes)
    end

    def delete_definition(id)
      @definitions.delete_at(id)
    end


  end

# end
