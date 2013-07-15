package PHP::matsuri2013;

use strict;
use warnings;
use File::Spec::Functions qw/catfile/;
use File::Basename;
use Plack::Request;

sub psgi_app {
    my $env = shift;
    return sub {
        my $req = Plack::Request->new(shift);
        my $name = $req->param('name');
        unless ($name) {
            $name = 'hello';
        }
        my $file = catfile(dirname(__FILE__) . '/../../php/' . $name . '.php');
        # PHPを実行して結果を受け取る
        open my $result, "php $file |" or die $!;

        my $res = $req->new_response(200);
        $res->content_type('text/html');
        $res->content($result);

        $res->finalize();
    };
}

1;
