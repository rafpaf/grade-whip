warn() {
    echo "From: Raffi Krut-Landau <raffi@ex.plicat.io>
    Reply-to: Raffi Krut-Landau <raphael.kl@gmail.com>
    Subject: Emails will go in $1 minutes
    To: raphael.kl@gmail.com

    Emails will go in $1 minutes" | sendmail raphael.kl@gmail.com
}

send() {
    while IFS=, read lastname firstname studentid dummy
    do
        # The dummy is there so that $studentid doesn't end with a newline
        echo $studentid
        pwlength=8
        pw=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c $pwlength`
        new_dir="2016/phil203/assignments/$studentid-$pw"
        webroot="~/webapps/explicatio"
        mkdir -p $webroot/$new_dir
        path="$new_dir/paper3.pdf"
        cp $original_dir/$studentid.pdf "$webroot/$path"
        url="http://ex.plicat.io/$path"
        #to="raphael.kl+$studentid@gmail.com"
        to="$studentid@princeton.edu"
        echo "From: Raffi Krut-Landau <raffi@ex.plicat.io>
Reply-to: Raffi Krut-Landau <raphael.kl@gmail.com>
Subject: Paper 3
To: $to

Dear $firstname,

I hope this email finds you doing well. To find your third paper, with my
comments, please navigate here: $url

All best wishes,
Raffi" | sendmail $to

    done <students.csv
}

#warn 1020; sleep 600m
#warn 420; sleep 30m
#warn 390; sleep 30m
warn 360; sleep 30m
warn 330; sleep 30m
warn 300; sleep 30m
warn 270; sleep 30m
warn 240; sleep 30m
warn 210; sleep 30m
warn 180; sleep 30m
warn 150; sleep 30m
warn 120; sleep 30m
warn 90; sleep 30m
warn 60; sleep 30m
warn 30; sleep 10m
warn 20; sleep 5m
warn 15; sleep 5m
warn 10; sleep 1m
warn 9; sleep 1m
warn 8; sleep 1m
warn 7; sleep 1m
warn 6; sleep 1m
warn 5; sleep 1m
warn 4; sleep 1m
warn 3; sleep 1m
warn 2; sleep 1m
warn 1; sleep 1m

send

# Put papers here in pdf form as studentid.pdf
original_dir=~/projects/2016/phil203/assignments/paper3

#######################

echo "From: Raffi Krut-Landau <raffi@ex.plicat.io>
Reply-to: Raffi Krut-Landau <raphael.kl@gmail.com>
Subject: Emails sent
To: raphael.kl@gmail.com

Emails sent" | sendmail raphael.kl@gmail.com
