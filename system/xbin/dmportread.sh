#!/system/bin/sh

# Fix dmportread to prevent rild crash(aka undead call fix) - bftb0
_DIR='/data/data/com.android.dmportread'
_HIST="$_DIR"'/history'

log -p i -t dmportread "preventing undead calls caused by rild crash";

# create dmportread directory if it doesn't exist
if [ ! -d $_DIR ]; then
  mkdir $_DIR
  chown 1001:1001 $_DIR
  chmod 755 $_DIR
fi

# if the history file exists already, clobber it
cp /dev/null $_HIST
chown 1001:1001 $_HIST
chmod 666 $_HIST
log -p i -t dmportread "done with undead call fix";
