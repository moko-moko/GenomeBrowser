package GenomeBrowser::Controller::Analysis;
use Mojo::Base 'Mojolicious::Controller';

# dataの構造を人間にわかる形に出力する
use Data::Dumper;
# This action will render a template
sub welcome {
    my $self = shift;

# webブラウザからのリクエストを取得する
    my $params = $self->req->params->to_hash;
# 取得したリクエストパラメータを出力、そして、die (止める)
    die '$params: ', Dumper $params;



#指定のテンプレートファイルを実行
    return $self->render( template => 'genomesearch');
}

1;
