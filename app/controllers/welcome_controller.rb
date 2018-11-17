class WelcomeController < ApplicationController
  def index
    render html: '<div><h1>Hello, World!</h1></div>'.html_safe
  end
end
