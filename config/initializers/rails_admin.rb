# RailsAdmin config file. Generated on March 12, 2013 12:17
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.authorize_with :cancan
  config.authenticate_with do
    require_login
  end

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['pour & pedal', 'admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  config.audit_with :paper_trail, User

  config.model 'User' do
    object_label_method do
      :name
    end
    list do
      field :name
      field :email
    end

    edit do
      field :name do
        help 'required'
      end
      field :email do
        help 'required'
      end
    end

    show do
      field :name
      field :email
    end
  end

  config.model 'Review' do
    list do
      field :name
      field :email
      field :hometown
      field :created_at
      field :featured
    end

    edit do
      field :featured do
        help 'optional: this will call out the review on the review page'
      end
      field :name do
        help 'required'
      end
      field :email do
        help 'required'
      end
      field :hometown do
        help 'required'
      end
      field :content do
        help 'required'
      end
    end

    show do
      field :featured
      field :name
      field :email
      field :hometown
      field :content
      field :created_at
    end
  end

  config.model 'Photo' do
    list do
      field :title
      field :photo
    end

    edit do
      field :title do
        help 'required: this will identify the photo when adding to events'
      end
      field :photo do
        help 'required'
      end
      field :is_primary do
        help 'optional: only one primary photo per event or location'
      end
      field :events do
        help ''
      end
    end

    show do
      field :title
      field :photo
      field :events
      field :is_primary
      field :created_at
    end
  end

  config.model 'Location' do
    list do
      field :name
    end
  end

  config.model 'Faq' do
    list do
      field :question
    end
  end

  config.model 'Event' do
    list do
      field :title
      field :location
    end
  end

  config.model 'Trip' do
    list do
      field :event
      field :title
      field :date
      field :spots_available
      field :tickets_sold
      field :price
    end

    edit do
      field :title do
        help 'required: this identifies the trip in the event listings. Use a title like, "April 25" or "April 25-VIP" if the titles need to be distinguished.'
      end
      field :date do
        help 'required'
      end
      field :price do
        help 'required: numbers only (i.e. 125.00 or 125)'
      end
      field :spots_available do
        help 'optional: only whole numbers'
      end
      field :tickets_sold do
        help 'this field will automatically update based on sales'
      end
    end
  end

  config.model 'Client' do
    object_label_method do
      :last_name
    end

    list do
      field :first_name
      field :last_name
      field :email
      field :trip
      field :confirmation
    end
  end

  config.model 'Contact' do
    object_label_method do
      :last_name
    end

    list do
      field :responded
      field :first_name
      field :last_name
      field :phone
      field :email
    end

    edit do
      field :responded
      field :response_date
      field :responded_by
      field :notes
      field :first_name
      field :last_name
      field :phone
      field :email
      field :message
    end
  end

  config.model 'Confirmation' do
    object_label_method do
      :confirmation_number
    end

    list do
      field :confirmation_number
      field :is_used
      field :expiration_date
      field :trip
    end

    edit do
      field :confirmation_number do
        help 'required: this number can be either a discount code or reservation confirmation number'
      end
      field :is_used do
        help 'this will automatically update when used, but it can be manually changed as well'
      end
      field :expiration_date do
        help 'optional'
      end
      field :source do
        help 'optional: the creator of the confirmation (i.e. the website, groupon, living social, etc)'
      end
      field :created_by do
        help 'the creator of the confirmation number, either an employee name or the client directly through the website'
      end
      field :value do
        help 'dollar amount in decimials (i.e. 125, 125.0, or 125.00) this will be the amount of discount the code allows or the dollar value of the reservation.'
      end
      field :is_cancelled do
        help 'check this box to instantly cancel any confirmation/code'
      end
    end
  end

end
