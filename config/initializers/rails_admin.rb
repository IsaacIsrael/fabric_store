RailsAdmin.config do |config|

  ### Popular gems integration
  config.main_app_name = ["Fabric Store"]
  config.parent_controller = 'ApplicationController'

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  # == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = false

  config.model 'User' do
    visible false
  end

  config.model 'Product' do
    include_all_fields
    field :price, :money
    exclude_fields :price_cents, :price_currency

    edit do
      include_all_fields
      field :price, :decimal
      exclude_fields :price_cents, :price_currency
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    all
    import
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
