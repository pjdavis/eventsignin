Pakyow::App.routes do
  # define your routes here

  # see something working by uncommenting the line below
  # default do
  #   puts 'hello'
  # end

  restful :event, '/events' do
    list do
      view.scope(:event).apply(Event.order(Sequel.desc(:created_at)).all)
    end

    new do
      view.scope(:event).bind(Event.new)
    end

    create do
      Pakyow.logger.write "params: #{params}"
      @event = Event.new(params[:event])
      if @event.valid?
        @event.save
        redirect router.group(:event).path(:list)
      end
    end

    remove do
      Pakyow.logger.write "params: #{params}"
      Event.find(params[:event_id]).delete
      redirect router.group(:event).path(:list)
    end
  end
end
