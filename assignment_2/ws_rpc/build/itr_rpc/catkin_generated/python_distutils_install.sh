#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/homeL/1wang/RPC2023/assignment_2/ws_rpc/src/itr_rpc"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/homeL/1wang/RPC2023/assignment_2/ws_rpc/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/homeL/1wang/RPC2023/assignment_2/ws_rpc/install/lib/python3/dist-packages:/homeL/1wang/RPC2023/assignment_2/ws_rpc/build/itr_rpc/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/homeL/1wang/RPC2023/assignment_2/ws_rpc/build/itr_rpc" \
    "/usr/bin/python3" \
    "/homeL/1wang/RPC2023/assignment_2/ws_rpc/src/itr_rpc/setup.py" \
     \
    build --build-base "/homeL/1wang/RPC2023/assignment_2/ws_rpc/build/itr_rpc" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/homeL/1wang/RPC2023/assignment_2/ws_rpc/install" --install-scripts="/homeL/1wang/RPC2023/assignment_2/ws_rpc/install/bin"
