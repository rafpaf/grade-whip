###########
# OPTIONS #
###########

# I assume that student emails are all something@university.edu. So put your
# @university.edu in this variable.
EMAIL_SUFFIX="@sas.upenn.edu"

MY_NAME="Raffi Krut-Landau"

# On my server I send from this address.
MY_EMAIL="raffi@ex.plicat.io"

# My gmail address.
MY_REPLY_TO="rkrut@sas.upenn.edu"

# The URL where the remote files are hosted
HOST="http://ex.plicat.io/"

# The path on the remote server where the files will be hosted
WEBROOT="~/webapps/explicatio"

# Where you will put the PDFs containing students' papers. Each PDF must be
# called studentid.pdf where studentid is the first part of the student's email
# address (before the @).
UPLOAD_DIR="~/o/isp/2021/seminarpaper1"

# The directory on the remote server where directories will be created
# containing students' papers.
DOWNLOAD_DIR="2021/isp/seminarpaper1"

# Each student will be able to download a file with this name.
PDFNAME="paper1.pdf"

# The length of the password that will be appended to each directory containing
# a student's paper for security.
PWLENGTH=8

warn() {
    # Warn the grader that the emails will be going soon.
    echo "From: $MY_NAME <$MY_EMAIL>
    Reply-to: $MY_NAME <$MY_REPLY_TO>
    Subject: Emails will go in $1 minutes
    To: $MY_REPLY_TO

    Emails will go in $1 minutes" | sendmail $MY_REPLY_TO
}

send() {
    # Read from students.csv and send emails.
    while IFS=, read lastname firstname studentid dummy
    do
        # The dummy is there so that $studentid doesn't end with a newline
        echo $studentid
        pw=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c $PWLENGTH`
        new_dir="$DOWNLOAD_DIR/$studentid-$pw"
        mkdir -p $WEBROOT/$new_dir
        path="$new_dir/$COMMENTFILENAME"
        cp $UPLOAD_DIR/$studentid.mp3 "$WEBROOT/$path"
        url="$HOST$path"
        to="$studentid"
        #to="$MY_REPLY_TO"
        echo "From: $MY_NAME <$MY_EMAIL>
Reply-to: $MY_NAME <$MY_REPLY_TO>
Subject: $EMAIL_SUBJECT
To: $to

Dear $firstname,

I hope this email finds you doing well. Please find my comments on your second paper here: $url

Best wishes,
Raffi" | sendmail $to

    done <students.csv
}

warn 720; sleep 60m
warn 660; sleep 60m
warn 600; sleep 60m
warn 540; sleep 60m
warn 480; sleep 60m
warn 420; sleep 30m
warn 390; sleep 30m
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

#######################

echo "From: $MY_NAME <$MY_EMAIL>
Reply-to: $MY_NAME <$MY_REPLY_TO>
Subject: Emails sent
To: $MY_REPLY_TO

Emails sent" | sendmail $MY_REPLY_TO

