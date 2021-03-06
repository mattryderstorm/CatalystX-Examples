package Yardbird;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
  -Debug
  ConfigLoader
  Static::Simple

  Authentication
  Authorization::Roles

  Session
  Session::Store::File
  Session::State::Cookie 
/;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
    name => 'Yardbird',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
);

__PACKAGE__->config(
  # Configure the view
  'View::TT' => {
    #Set the location for TT files
    INCLUDE_PATH => [
      __PACKAGE__->path_to( 'root', 'src' ),
    ],
  },
);  

# Configure SimpleDB Authentication
__PACKAGE__->config(
    'Plugin::Authentication' => {
        default => {
            class           => 'SimpleDB',
            user_model      => 'DB::User',
            password_type   => 'self_check',
        },
    },
);

# Start the application
__PACKAGE__->setup();
