class CustomError

    def initialize(message = nil)
        @errors = []
        @errors << message unless message.blank?
    end

    def add(message)
        raise_if_no_message_provided(message)
        @errors << message
        self
    end

    def size
        @errors.size
    end

    def none?
        size.zero?
    end

    def all
        @errors
    end

    def as_sentence
        @errors.to_sentence.capitalize
    end

    def convert(errors)
        class_type = errors.class.to_s 
        messages = []
        # Convert to a message array based on the type passed in
        # If it's an active model's error object
        message = errors.full_messages if class_type == 'ActiveModel::Errors'
        # If its an array
        messages = errors if class_type == 'Array'
        messages = errors&.errors&.full_messages || [] unless class_type.in?(%w[Array ActiveModel::Errors])
        # Loop over messages, adding them to the @errors array
        messages.each { |error| @errors << error }
        self
    end

    private

    def raise_if_no_message_provided(message)
        raise 'Must provide usable error message!' if message.blank?
    end

end