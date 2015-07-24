Pakyow::App.routes do
  # define your routes here

  # see something working by uncommenting the line below
  # default do
  #   puts 'hello'
  # end

  restful :event, '/events/' do
    list do
      Pakyow.logger.write Event.all
      view.scope(:event).apply(Event.all)
    end

    new do
      @event = Event.new
    end
  end
end
