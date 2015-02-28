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

    # 入力された値を受け取る
    my $val = $params;

    # 入力された値を検査する
    my $valide_error = $self->_check_error($val);
    die '$valide_error: ', Dumper $valide_error;

    # 入力された値に問題がある場合は、エラーを返して画面を表示
    if ($valide_error) {
        $self->{stash}->{error} = 'error!!';
        return $self->render( template => 'genomeresearch');
    }

    # 入力された値が問題がない場合は、次のステップへ、ロジックへ受け渡し
    # 入力された値を加工して、まとめる。
    my $cond = +{
        id => '',
        key => '',
    };

    # ロジックの中で処理を行う
    # ロジックから値を受け取り
    my $result = $self->_logic_genome($cond);

    # 画面、viewに値を引き渡し、
    $self->{stash} = $result;

    # 画面、viewの表示をして修了
    #指定のテンプレートファイルを実行
    return $self->render( template => 'genomesearch');
}

sub _logic_genome {
    my $self = shift;
    my $cond = shift;

    return;
}

sub _check_error {
    my $self = shift;
    my $val  = shift;

    $val = $val->{genom};

    my $valide_error = 'not_ok';

    my @val = split ',', $val;
    $val = join '', @val;

    return $valide_error = 'ok'
        if $val =~ /^chr(\d+|\X|\Y)\:(\d+)\-(\d+)$/;

    return $valide_error;
}

1;
