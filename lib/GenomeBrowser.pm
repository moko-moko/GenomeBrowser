package GenomeBrowser;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to(controller => 'analysis', action => 'welcome');
  $r->get('/search')->to(controller => 'analysis', action => 'welcome');

}

1;
