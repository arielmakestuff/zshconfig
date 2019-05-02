# =================================================================
# Rust settings
# =================================================================


export RUSTUP_HOME=$XDG_DATA_HOME/rustup

export CARGO_HOME=$XDG_DATA_HOME/cargo

export RUST_SRC_PATH=$RUSTUP_HOME/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

if [ -x "$(command -v sccache)" ]; then
    export RUSTC_WRAPPER=sccache
fi

# Path is set to zprofile.d/000-path.zsh
# path=($CARGO_HOME/bin $path)


# =================================================================
#
# =================================================================
