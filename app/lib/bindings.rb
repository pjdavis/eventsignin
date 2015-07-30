Pakyow::App.bindings do
  scope :event do
    restful :event

    binding :destroy_event do
        {
            action: router.group(:event).path(:remove, event_id: bindable.id),
            method: 'post',
            view: lambda { |view|
                view.prop(:destroy_event).prepend(Pakyow::Presenter::View.new('<input type="hidden" name="_method" value="delete">'))
            }
        }
    end
  end
end
