Rails.application.routes.draw do
  root :to => redirect("/reminders")
  resources :reminders
end
