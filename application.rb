require 'rubygems'
require 'sinatra'
require 'mixpanel'

### Set Mixpanel
use Mixpanel::Tracker::Middleware, 'MIXPANEL_TOKEN'

before do 
  @mixpanel = Mixpanel::Tracker.new('MIXPANEL_TOKEN', request.env, true)
end

get '/' do
  @mixpanel.track_event("Home Page View")
  "Hello world!"
end